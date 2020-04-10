Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB41A4807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 17:59:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zN3t22jNzDrBx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 01:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=Zh7jbnBm; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zN255fzVzDrB9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 01:57:33 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id u2so2160544iop.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cmgNQ18bQZuP/PsrCAMjWp3cC4Z/HjH3ZP68Agn9Q9I=;
 b=Zh7jbnBmhR1yBRFDVmFJ4KzmlptydnzXIJnoy/ZUkT8LIveuLD6PNl3ZN/AumjpZNj
 /ATLX1BRoGcA0s6io0u9kjBjnBW3bIgMcCaaAUdrJIxaFDbiOm6W8xpYL04XoFV1Z39G
 W0Tj9sIIATI2ED9zRyEmQ/clSfVdQcTZvUcgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cmgNQ18bQZuP/PsrCAMjWp3cC4Z/HjH3ZP68Agn9Q9I=;
 b=BY5L5wKkZaEbDeBb0MISFREo28NUkoahUfzcdgt9oGQRFOZ3hOw6hHFsqBlFiFPsk4
 io0grj/coVZlW64bdFrQoLz+QZKQ+orAzKrUgGSqv3a0o8DxuosTNt6ZNrZLittAGLmD
 zAegKb100TSeaNiYRJtAPS500Ee4aCucCF1CAyk3D1TatlvslVLUD4iBcAiE/gXqk2/9
 KKAJMLsQMg7zb8RC7mxb003+rM6Z6b388U8Z4FOlziJc+X3CkqJiDmzv/kx+Ryg1iwmX
 VrUP82F72jR7Z8VAmdVzKgbXj1+8tLpEUOEqPZiAqd1o2i/vpTe18yErrpWnre727Ab4
 7Tcg==
X-Gm-Message-State: AGi0PubjM0DxqeyrbvL7sXVc6p2j4x3qv5VtUPd1N9DCI0cCjYzCMFXw
 6PV/ThNAr0PiKL27Bt9ACoNnYA==
X-Google-Smtp-Source: APiQypI+9ul4Vwa9aPByPnHLiWGHPAk+YdhmBpUDxRSELcFECrdIik4lACPB3aKsG1Pr8V2Ff1JQjA==
X-Received: by 2002:a02:c9cb:: with SMTP id c11mr4950972jap.93.1586534249733; 
 Fri, 10 Apr 2020 08:57:29 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id u4sm685124iog.21.2020.04.10.08.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2020 08:57:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] selftests: vm: Do not override definition of ARCH
To: Michael Ellerman <mpe@ellerman.id.au>,
 Sandipan Das <sandipan@linux.ibm.com>, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1580367152.git.sandipan@linux.ibm.com>
 <471a73600bf9f59a59484726f50f81d7f54f4b2f.1580367152.git.sandipan@linux.ibm.com>
 <87lfp9zvl4.fsf@mpe.ellerman.id.au>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dbaeecdc-6145-50ca-b874-9f3ed11c927b@linuxfoundation.org>
Date: Fri, 10 Apr 2020 09:57:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87lfp9zvl4.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: aneesh.kumar@linux.ibm.com, kamalesh@linux.vnet.ibm.com, linux-mm@kvack.org,
 mhiramat@kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/10/20 7:49 PM, Michael Ellerman wrote:
> Sandipan Das <sandipan@linux.ibm.com> writes:
>> Independent builds of the vm selftests is currently broken
>> because commit 7549b3364201 overrides the value of ARCH with
>> the machine name from uname. This does not always match the
>> architecture names used for tasks like header installation.
>>

In the interest not adding more delays to this patch, I fixed up
the commit log for the following error and applied it. I hope to
send this up for next rc.

ERROR: Please use git commit description style 'commit <12+ chars of 
sha1> ("<title line>")' - ie: 'commit 7549b3364201 ("selftests: vm: 
Build/Run 64bit tests only on 64bit arch")'
#93:
because commit 7549b3364201 overrides the value of ARCH with


The fixed up now looks as follows:

Independent builds of the vm selftests is currently broken because
commit 7549b3364201 ("selftests: vm: Build/Run 64bit tests only on
64bit arch") overrides the value of ARCH with the machine name from
uname. This does not always match the architecture names used for
tasks like header installation.

Please make sure to run checkpatch with --strict to catch these
kinds of errors in the future.

thanks,
-- Shuah
