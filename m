Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E351D610621
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 01:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mz1Yn623Kz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 10:08:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ZNNSYZLM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ZNNSYZLM;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mz1Xs4CX8z3c7H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 10:07:25 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 20so3169431pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 16:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gyfpmFe14VJ3jdYNVJ0rx3Ah2uaRzNTmMnT4495S4I=;
        b=ZNNSYZLMCiTx3pCpdTSLaMqTAwcT0XD23hboDkck2m1sj0K18I/wiwFIJBnxkxlMh1
         TMOX+6v0XNUWVLrMkaS7nFMD6HK3C70ZLK5411vF56AMxZrrEveIWdn7U/wWYAX6hu8f
         z7X+MhLcDZ2abQ+JkeJnFiHqWkFba2HtnVwkX4LhmKXO9kCXDrbkBH+MQc0VlITciM7I
         DQ4GGK7LnrmeObtOo33dthlXeC/HBl0rQRBuyHKeRHXZmYYPUrcsYqTcTlXIWwUSoL9i
         Op+9awjoXqXajuMDeHaLc5MvW/7/blHnT1v9JwgcyUng9A7q3UoZ9aZNVukbXbfjaCwz
         UOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gyfpmFe14VJ3jdYNVJ0rx3Ah2uaRzNTmMnT4495S4I=;
        b=jTVTxmCvyM52reFYPCNUF03OKZV409KlUnTTlV+XG3XXtV8Vi/nCyAUORqKRTC9BEh
         x86cdCRfPNBAe4NE9qUOo9yhlmuSW32x3Vj7nYTh+8V+6AlpydforaRwlCcXd0kl8Lme
         VhuRvc3Z3aPceAVEAx5upOKhGNCm2hoKittMQp3/DWQBaL12RBabG1PKWu2cFxLrCA/5
         YFYH184DJlslHlayRGazheEXPozeJcEJY0z1vTaL/o7qB7oMT23KKrz6lf4ximMUDiIp
         BThI4Y12jmC1HpCbhbJ4ZJ8Q91LOkowDK2B8EeCLdB83g1EW6TBydmimhdoTIspSIbYj
         n9cw==
X-Gm-Message-State: ACrzQf1u8wbejrfQyPQjFFjRTi42VcR3X6A0PtGdId7AnScSMrIXfTZe
	8LDMPFCIQ8TxI8RvDI2sAhxChA==
X-Google-Smtp-Source: AMsMyM48cCCOaGHpcUrqKPuvLPqi8N0s0YHUDIkD3gXkNLjihHit7dpsoFkfZbjAvACH4Z61kt9rCg==
X-Received: by 2002:a65:44c1:0:b0:428:ab8f:62dd with SMTP id g1-20020a6544c1000000b00428ab8f62ddmr44319504pgs.211.1666912040505;
        Thu, 27 Oct 2022 16:07:20 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b00186e8526790sm1675818plb.127.2022.10.27.16.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:18 -0700 (PDT)
Date: Thu, 27 Oct 2022 16:07:18 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Oct 2022 15:22:27 PDT (-0700)
Subject: Re: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-b3bcbdea-1572-44ba-9d9a-e35e55b8880f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jonas@southpole.se, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, dave.hansen@linux.intel.com, gor@linux.ibm.com, yury.norov@gmail.com, hca@linux.ibm.com, x86@kernel.org, linux-kernel@vger.kernel.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, mingo@redhat.com, bp@alien8.de, Paul Walmsley <paul.walmsley@sifive.com>, shorne@gmail.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de, aou@eecs.berkeley.edu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 14 Oct 2022 08:58:43 PDT (-0700), ajones@ventanamicro.com wrote:
> Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
> started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
> are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
> start and next seq operations implement a pattern like
>
>   n = cpumask_next(n - 1, mask);
>   show(n);
>   while (1) {
>       ++n;
>       n = cpumask_next(n - 1, mask);
>       if (n >= nr_cpu_ids)
>           break;
>       show(n);
>   }
>
> which will issue the warning when reading /proc/cpuinfo.
>
> [*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.
>
> This series address the issue for x86 and riscv, but from a quick
> grep of cpuinfo seq operations, I think at least openrisc, powerpc,
> and s390 also need an equivalent patch. While the test is simple (see
> next paragraph) I'm not equipped to test on each architecture.
>
> To test, just build a kernel with DEBUG_PER_CPU_MAPS enabled, boot to
> a shell, do 'cat /proc/cpuinfo', and look for a kernel warning.
>
> While the patches are being posted together in a series since they're
> for two different architectures they don't necessarily need to go
> through the same tree.
>
> v3:
>   - Change condition from >= to == in order to still get a warning
>     for > as that's unexpected. [Yury]
>   - Picked up tags on the riscv patch
>
> v2:
>   - Added all the information I should have in the first place
>     to the commit message [Boris]
>   - Changed style of fix [Boris]
>
> Andrew Jones (2):
>   RISC-V: Fix /proc/cpuinfo cpumask warning

I just took the RISC-V fix, might be worth re-sending the x86 one alone 
as nobody's replied over there so it may be lost.

Thanks!

>   x86: Fix /proc/cpuinfo cpumask warning
>
>  arch/riscv/kernel/cpu.c    | 3 +++
>  arch/x86/kernel/cpu/proc.c | 3 +++
>  2 files changed, 6 insertions(+)
