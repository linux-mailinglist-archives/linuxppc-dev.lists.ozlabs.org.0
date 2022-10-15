Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 863515FFB9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 20:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MqWVt17m0z3chb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 05:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FyRwiQ1K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736; helo=mail-qk1-x736.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FyRwiQ1K;
	dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MqWTy5kpNz2yYj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Oct 2022 05:08:53 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id 8so4458428qka.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wAaC7lbGaB3AX/Lsftuvb2OO1sJpQJ6Ykn9DFNJXY0=;
        b=FyRwiQ1Kkh2U3R7rwv/cUWgWbhnhVuRAkvLikv3swWoWi+Qni43MwmjlvAl7Qd5YWU
         e3eQ8r4coovbGUfjgmrmah9muM3lMIJqLMPtobpzhigxXHyNURqImNwciQiRzGsAHdHO
         qXOEVFqd/G+S/R1kNsVrId98EksJPTRvXw6S31DLxWwCE/s50meM1rY5rsjT96D1ObDy
         lCH7/wDPhN4Zl3js/rayUXV95GaO+0Ed0I7Aor4TcANC3GM2Q2PJASLmjnpLgyV/gbKH
         KXTHOpPBMJ9ORopJ3VS/8U3M5d4tTN/mU0ZQfTgvUx8AXj2lFRY2L268IjoNTL418YNj
         eMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wAaC7lbGaB3AX/Lsftuvb2OO1sJpQJ6Ykn9DFNJXY0=;
        b=q1aAP1HSuIdOPBLL7lymC/YUMlkDzPelj3pv/Cpd1vmNeXU81DEg0Kp8LrNZYpVYjV
         pdyrirH+d8BuIjRBZeAuVRV3lK88mBcDbl30ci+z8aRyFzXMQcO0eirWjnqgy1VvkO/y
         zyXb8c9ub7OOZg3f06EVv7HlN01769UpD0SxG3gURXZuUTOLwZxBnDVfvFqtegWwKuBA
         25hHtmeFSjXFHeUtVNElf8ccwzbZDogIuGP1aYPCjARk6VSg5/iV+BYoyn8iU3W/ML+d
         9H05bq4SuQQBWO64xU+jGalcU0zRjiozG91OHfX3NpOL76PBdoFCwOUdaCI5ta0oWbqP
         UZ3g==
X-Gm-Message-State: ACrzQf2P4SWn+strQbOu3/fCKMQLdqC8AyLn/YDjwWqa+T4m0KdOcKLc
	+vWDH4oQso+J9RR90Rtscgs=
X-Google-Smtp-Source: AMsMyM6RKmR37GztXAcqofHNQn3klZzUQq+GK3VRFWmYfAI4qhzKm9L4cuQOR6HCO3RXlQARuABfrA==
X-Received: by 2002:a37:6303:0:b0:6ec:554b:131d with SMTP id x3-20020a376303000000b006ec554b131dmr2532393qkb.166.1665857330103;
        Sat, 15 Oct 2022 11:08:50 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:2270:2b6d:8b98:c35a:4b7])
        by smtp.gmail.com with ESMTPSA id h6-20020a05620a400600b006b949afa980sm5294690qko.56.2022.10.15.11.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Oct 2022 11:08:49 -0700 (PDT)
Date: Sat, 15 Oct 2022 11:08:51 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 0/2] Fix /proc/cpuinfo cpumask warning
Message-ID: <Y0r3M+WCMqugVoXf@yury-laptop>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014155845.1986223-1-ajones@ventanamicro.com>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 05:58:43PM +0200, Andrew Jones wrote:
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

Acked-by: Yury Norov <yury.norov@gmail.com
