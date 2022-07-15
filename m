Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A05759DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 05:13:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lkbzk4sDKz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 13:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d6rOttoa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d6rOttoa;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lkbz255x4z3bmG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 13:13:17 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id c3so2628224pfb.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 20:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0kNvzHNczTALecfT9wto6CsS50awskOSoxCbfvaNPgc=;
        b=d6rOttoave+cYYycQLZVtn7+6/EvvZMoC4KlEKnu5+Iy0CvIZB6RZvM+yDNYgjVsg2
         zExWP1Kt2mvHL2caS42uLQwLfFdIGT+vt+VNkOv6EFVEz1IJ1Ei1z/SUwomvWvL9yqs/
         LsfjR3vwcHDm1bfvDdBsjVXVCIzYFoJ6KMcatcAC61WXc2/vMcOjiKCXnv0z+ZYpPW1D
         29300GYk48m1QvWYlTwrWUJ2ga8Ap1QJw6DN92YdxZnF6aT4PwJr+48L7OzWyifSHnIo
         bBliGjA2A7iI1JHvd2yG0VTITazqxx3xOm38zhCb9ZIUiYeXEPs2TlvdcILgJvPCljIq
         R2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0kNvzHNczTALecfT9wto6CsS50awskOSoxCbfvaNPgc=;
        b=TBaxr+JEsejNDmLD/vP0eh/6j7NIZQwMc+QmipakqTpnvsbvK/Law256L44s/munC2
         ur1a/J8JX00NlMkibnd+bmHs8auPcPksBXlqeeCcXVqIBLUjZVYiCFNNfOc20Z2CU7mS
         LRWUxqHnrjPaCeINRqYxjSkiXzJ1/Dg1TvS9d/06wJFtmqYoAiRDnkBztSt1MKfyJjU4
         GDrnfP2HCmQBdAxgMnhnV5sZyulQdkMzAwoSuz48Y3KAtycs4tfXJOLBqyI7n+G1TT4l
         gveMs8Cm0DeMEpAbunQrVhnX36Jb+F2DralMOytfiYE+nK/2D4YbUcPiOnD5zW146bVZ
         3mpA==
X-Gm-Message-State: AJIora/uO0A45Dk1g0lqbvg7A1PXkMBp1W7Eucd/UPiMoUcavdpCVPYY
	w0tAK2kPkd1Dr6l5kamsHMg=
X-Google-Smtp-Source: AGRyM1vK5uqkhNs5DYoiUnUKiOfj2RRKOpP4xHProAEOYr/w1Br1ZQPpNcitPwDkSe+/qgFCXMCFZg==
X-Received: by 2002:a63:2051:0:b0:412:6d61:ab0a with SMTP id r17-20020a632051000000b004126d61ab0amr10627004pgm.52.1657854794876;
        Thu, 14 Jul 2022 20:13:14 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id d12-20020a170903230c00b0016c6a6d8967sm2236563plh.83.2022.07.14.20.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 20:13:14 -0700 (PDT)
Message-ID: <d95d1afe-655c-3526-0c7e-949dfad8c6ba@gmail.com>
Date: Thu, 14 Jul 2022 20:13:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH V12 01/20] uapi: simplify __ARCH_FLOCK{,64}_PAD a little
Content-Language: en-US
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de, nathan@kernel.org,
 naresh.kamboju@linaro.org
References: <20220405071314.3225832-1-guoren@kernel.org>
 <20220405071314.3225832-2-guoren@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220405071314.3225832-2-guoren@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, heiko@sntech.de, linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/5/2022 12:12 AM, guoren@kernel.org wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> Don't bother to define the symbols empty, just don't use them.
> That makes the intent a little more clear.
> 
> Remove the unused HAVE_ARCH_STRUCT_FLOCK64 define and merge the
> 32-bit mips struct flock into the generic one.
> 
> Add a new __ARCH_FLOCK_EXTRA_SYSID macro following the style of
> __ARCH_FLOCK_PAD to avoid having a separate definition just for
> one architecture.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Being late to this, but this breaks the perf build for me using a MIPS 
toolchain with the following:

   CC 
/home/fainelli/work/buildroot/output/bmips/build/linux-custom/tools/perf/trace/beauty/fcntl.o
In file included from 
../../../../host/mipsel-buildroot-linux-gnu/sysroot/usr/include/asm/fcntl.h:77,
                  from ../include/uapi/linux/fcntl.h:5,
                  from trace/beauty/fcntl.c:10:
../include/uapi/asm-generic/fcntl.h:188:8: error: redefinition of 
'struct flock'
  struct flock {
         ^~~~~
In file included from ../include/uapi/linux/fcntl.h:5,
                  from trace/beauty/fcntl.c:10:
../../../../host/mipsel-buildroot-linux-gnu/sysroot/usr/include/asm/fcntl.h:63:8: 
note: originally defined here
  struct flock {
         ^~~~~
make[6]: *** 
[/home/fainelli/work/buildroot/output/bmips/build/linux-custom/tools/build/Makefile.build:97: 
/home/fainelli/work/buildroot/output/bmips/build/linux-custom/tools/perf/trace/beauty/fcntl.o] 
Error 1

the kernel headers are set to 4.1.31 which is arguably old but 
toolchains using newer kernel headers do not fare much better either 
unfortunately as I tried a toolchain with kernel headers 4.9.x.

I will start doing more regular MIPS builds of the perf tools since that 
seems to escape our testing.

Thanks!
-- 
Florian
