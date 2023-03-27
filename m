Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8D6CA446
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:43:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXY42LPYz3bZv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:43:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UJGzp2C7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UJGzp2C7;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXX92Pcsz3bTG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:42:32 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6261eca70f7so373711b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679920949;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm9bgJtF1FrdwcrIyXLASF/q7xHN2IePxGqvLqlnOM8=;
        b=UJGzp2C7JnUj/mPOpVhPnpCRFBFUVWWi2qLSFnXrl19yZFG55duAVmse5LUuSC3GK1
         OyjhDz3iGcX8U4mD3py2DUEDFnLPP97/AJNn+TSPBM0Fc+Xj8VLYZIkFMaIxTrdflHN3
         0+Ln4iq2nUz0xmddI43jIJOwuyHYrTMAGU9cJ2QrX5W0dNAn11QVUBjW603ItBwfrUJ2
         Fl8RHkLKBWDLOKFLD7TbaDTno9iRDHZT7RNXFhe4Lar+Idk9zNLEB1xqyiGmFmG7BecD
         HMuyOTDO+VHRmV3OhQs7dHeLNW02XDwP7fg1HaSRgpxS2GAyPh8zZEgA1tE3O+T7J9g1
         ql6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679920949;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rm9bgJtF1FrdwcrIyXLASF/q7xHN2IePxGqvLqlnOM8=;
        b=rzm1SgMBerwJqe8tNp4EcDo6ZeikvbsLdVZxS9xBEXsdzMTW3Fauoo3AXmM/eCo1aW
         DZPAoY8F3qgFbuUrYSXLdy9H/UDNCVr6RxpDY0A/XCwrV106WnoJzW01y4UVESg9m4t9
         saxo08uXZeMmmy4TT3ydvHWLuz0iB6BUQKvfQ0poKezxd+NzLgs8mk4xIIgxiTX+jJz0
         tYNkjtMFdw2brXbv4Em0PdmKxHSq8so73P4IKECu4ejuZcAfbYCzijGdEzpSjeLVGVKH
         czsIiVM7bpxBSY2z2IIlfUJbvw3eNsEJJpHq26PHekBiQiAO1DnPzbyZDC3QMMBl7Wzf
         PgLw==
X-Gm-Message-State: AAQBX9fqS1VRAt1OL26SNNAMIfmWX/MswgwLr1ISR49D0xkW8NSBmEeT
	Y2AyQ2Jk/y8JHCjoJHFtkVEoHQH23dKOUpe9AHMSbg==
X-Google-Smtp-Source: AKy350apvxf0kx16OsAM9d6R8f+CuNpIqnd5SDZHbz2c056P+JJ6iw0u+FotaBC6go1BYr1TTCi+Cw==
X-Received: by 2002:a17:90b:30d5:b0:23f:4e68:b860 with SMTP id hi21-20020a17090b30d500b0023f4e68b860mr8294596pjb.3.1679920949385;
        Mon, 27 Mar 2023 05:42:29 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 4-20020a630f44000000b00502dc899394sm17382198pgp.66.2023.03.27.05.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 05:42:28 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------6fIop0QxA6rbpl20xUJils52"
Message-ID: <1052468e-6b4e-16f2-a87e-fb403f0725f6@kernel.dk>
Date: Mon, 27 Mar 2023 06:42:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CRGYHQ3C77DV.1PXS812TV997N@bobo>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------6fIop0QxA6rbpl20xUJils52
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/23 12:36?AM, Nicholas Piggin wrote:
> On Mon Mar 27, 2023 at 8:15 AM AEST, Jens Axboe wrote:
>> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
>> from my (arguably very short) checking is not commonly done for other
>> archs. This is fine, except when PF_IO_WORKER's have been created and
>> the task does something that causes a coredump to be generated. Then we
>> get this crash:
> 
> Hey Jens,
> 
> Thanks for the testing and the patch.
> 
> I think your patch would work, but I'd be inclined to give the IO worker
> a pt_regs so it looks more like other archs and a regular user thread.

Yep I think that'd be a better idea. No better way to get a good patch
than to send out a bad one :-)

> Your IO worker bug reminded me to resurrect some copy_thread patches I
> had and I think they should do that
> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-March/256271.html
> 
> I wouldn't ask you to test it until I've at least tried, do you have a
> test case that triggers this?

I can test them pretty easily. I did write a test case that is 100%
reliable for me, attached. Just do:

$ gcc -Wall -o ppc-crash ppc-crash.c -luring
$ ulimit -c10000000
$ ./ppc-crash

and it'll bomb while trying to write that coredump.

-- 
Jens Axboe

--------------6fIop0QxA6rbpl20xUJils52
Content-Type: text/x-csrc; charset=UTF-8; name="ppc-crash.c"
Content-Disposition: attachment; filename="ppc-crash.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8dW5pc3Rk
Lmg+CgojaW5jbHVkZSA8bGlidXJpbmcuaD4KCmludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCnsKCXN0cnVjdCBpb191cmluZ19zcWUgKnNxZTsKCXN0cnVjdCBpb191cmluZyBy
aW5nOwoJdW5zaWduZWQgbG9uZyAqcHRyID0gTlVMTDsKCWNoYXIgYnVmWzE2Mzg0XTsKCWNo
YXIgZm5hbWVbMzJdOwoJaW50IGZkWzRdOwoJaW50IGk7CgoJZm9yIChpID0gMDsgaSA8IDQ7
IGkrKykgewoJCXNwcmludGYoZm5hbWUsICIvZGV2L3NobS90ZXN0LiVkIiwgaSk7CgkJZmRb
aV0gPSBvcGVuKGZuYW1lLCBPX1JEV1IgfCBPX0NSRUFULCAwNjQ0KTsKCQlpZiAoZmRbaV0g
PCAwKSB7CgkJCXBlcnJvcigib3BlbiIpOwoJCQlyZXR1cm4gMTsKCQl9Cgl9CgoJaW9fdXJp
bmdfcXVldWVfaW5pdCgzMiwgJnJpbmcsIDApOwoKCWZvciAoaSA9IDA7IGkgPCAzMjsgaSsr
KSB7CgkJdW5zaWduZWQgbG9uZyBvZmYgPSAxNjM4NCAqIChpIC8gNCk7CgkJaW50IGluZGV4
ID0gaSAmIDM7CgoJCXNxZSA9IGlvX3VyaW5nX2dldF9zcWUoJnJpbmcpOwoJCWlvX3VyaW5n
X3ByZXBfd3JpdGUoc3FlLCBmZFtpbmRleF0sIGJ1Ziwgc2l6ZW9mKGJ1ZiksIG9mZik7Cgl9
CgoJaW9fdXJpbmdfc3VibWl0KCZyaW5nKTsKCXVzbGVlcCgxMDAwKTsKCgkqcHRyID0gMHgx
MjM0Owp9Cg==

--------------6fIop0QxA6rbpl20xUJils52--
