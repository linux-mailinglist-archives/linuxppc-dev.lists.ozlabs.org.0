Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6336C291580
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 06:08:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDRG80rk5zDqvn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 15:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EfprqinP; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDR840pjVzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 15:03:31 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id h4so3694162pjk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 21:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=C+aijD2XhOVm310wYhkSxTnzHtu0eEUfvk+BZoL498Y=;
 b=EfprqinPNbsRvsed1FppBGTvKLNXS3dOIkTvo7HM4MWknsCELCXQDgVv1bDWbdPkQk
 VHIe7p76c8/fB82EGrjBBS0nPlForsY7a6YZbhlHPZ6Yv/w9szfwdxrT3zVPv4gcxjKu
 ETuf8U3oLbsMSUzmuT9XzQA35LFp1AvEygedfdSr43f2aHliyo2MTjjWKV6KeblmDSe3
 YQiRGU3sQILs3pOl/0UqHEW5Myo3U+T4zTasFK/g1jT4wKTz1tIjp/b57mDqT0yiRH7S
 ua5UJatNuYp04a7iXUS8RtKCE6wqW/h6Z3CvBx5dABJWzvPMIp+TYYZyvadrhdOqMvsk
 X58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C+aijD2XhOVm310wYhkSxTnzHtu0eEUfvk+BZoL498Y=;
 b=XJ2sRdf+5wbtGiFFNo9+G8qFrO1oDvg0MAc1Fhi7WyLPQjDosvXRuf/VG4IT5o3i59
 8eK+tQgv+Nz9R2qtB1zv/8xG+YhNJUfhp484jKMA3uHrHCYvaUJCwVZPIYdTg0j4CfH4
 koJVNq0Sdghriori//foB5+1Z1W0OMUTmc7gMOpbakC/28zbf6o+shXTzsI2i+2zoLj4
 HK92CSrQ1zzHtOurKoH9E78WHpF3I8CsW/s1S5AAeelbev4wT/kDsxMSvFFpVbKfph7j
 IQx9x7bNDWOKEyP+EXqoAwoBDYndqIQz6RCLhVjX10BqyXAmVHQK0EVSyIt9xpdpr75R
 zyng==
X-Gm-Message-State: AOAM530g6AWYcVAHvI+C79Iy9I+M0bxIiGrcMo53DTmFYrkL9LkwN8Sd
 OpGo22fQhN3dc8kW0zofnO8NpuOACZo=
X-Google-Smtp-Source: ABdhPJxfI+MacOPHzUeD44dF9djMxye5T6eVyK9NTn2hVjgUUZhs2x/sQ9WlGZDIX2nphe07Hc1rcQ==
X-Received: by 2002:a17:902:6845:b029:d4:d1d5:2139 with SMTP id
 f5-20020a1709026845b02900d4d1d52139mr11400380pln.53.1602993807196; 
 Sat, 17 Oct 2020 21:03:27 -0700 (PDT)
Received: from [192.168.0.102] ([49.207.205.150])
 by smtp.gmail.com with ESMTPSA id jy19sm7852981pjb.9.2020.10.17.21.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 21:03:26 -0700 (PDT)
Subject: Re: [PATCH v5 21/23] powerpc/book3s64/hash/kuep: Enable KUEP on hash
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-22-aneesh.kumar@linux.ibm.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <9c576b10-e3cb-b32a-ff0e-470f699dc072@gmail.com>
Date: Sun, 18 Oct 2020 09:33:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-22-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/08/20 9:39 am, Aneesh Kumar K.V wrote:
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/pkeys.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
