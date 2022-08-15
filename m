Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC8593A8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 22:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M64tR2hVrz3bPP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 06:01:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pCMF7N7I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pCMF7N7I;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M64sq6Tkcz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 06:01:19 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id 13so7244988plo.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 13:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc;
        bh=6dVv+H63DtoIdCRQZLuHzbkHiwYkHdDFz0Z0p4iyls4=;
        b=pCMF7N7IM+OfCaXakWNqUvzqQo47YHutXg38xDbRxHvLAw46XZlj93HJO4XixcO588
         A0w1kZ0YivIhZkB4v0jOLtgepsWwsX25mV9D5oxiCrrT//hwJNg0lyjeeyJozerfVgNh
         5HddCqyQDiWLFUMbZNtVA3kV+hLvuQVmQ6TF0DxcDQQTNjkGZ+CExyp5CGr+/xzMjBK5
         pQCcxLn15Ei5r6ZKUo00TiRnqDE8NuRy8AV/BVZLnQf5OV+9AwZ8c4V1aZlU+t1Kt/y6
         E4MDWEeVOON7aLea4TCiaZ/y49CjUnJkzXf90C3Oxcc0KagnIDbH46OpPORIUefi7jBT
         3XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc;
        bh=6dVv+H63DtoIdCRQZLuHzbkHiwYkHdDFz0Z0p4iyls4=;
        b=7/yAbDRInYZYe6Of0bCH5TmEgqinwkSXy0ekDdgmZexv1rYumoLevSbCqlsb62pjq5
         jDXVpWuDHZfheY/hBIzAMj8lsaGdSG0aZStTerYDEoOwN+JiZ8dwcd2FDF8A1Y7xYfc1
         l0fQLd/1aasf59AgYrY7ivkA4cu2E+TbXIEyd/bG7XGeKmrpViEUMtGOeQepAGXv4y2H
         C3R7ropby6hTJN4PZT1dLCPVyJWroHczG4L2gj1N/oA9PtKyjcvIcjj/qhP7eHydoup9
         giS6SyQKfIeI/9Bd9kZNZklfdqmM9EFa7fwsI6K3+xhzbZrmi54wyBo6Ke9FYZaPbBzK
         tErg==
X-Gm-Message-State: ACgBeo22FgqGHFWRs/cqWTC/ymysMo3n+SWjbn3ZS3PPMHiB6zeFcEhz
	zzXqKUZ9vo3ekKdrBPm1QG8=
X-Google-Smtp-Source: AA6agR5L7KbqpMu4buBwYeiPANM2K8S5fRdQ++PD0Lv38ssHa06i0JtXa2XtKYCgSrc2v8fjzed54g==
X-Received: by 2002:a17:90b:4a07:b0:1f5:1aff:4af with SMTP id kk7-20020a17090b4a0700b001f51aff04afmr19805527pjb.124.1660593676006;
        Mon, 15 Aug 2022 13:01:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y22-20020a170902b49600b0016ee4b0bd60sm7324943plr.166.2022.08.15.13.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 13:01:14 -0700 (PDT)
Date: Mon, 15 Aug 2022 13:01:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Fix get_phb_number() locking
Message-ID: <20220815200113.GA340585@roeck-us.net>
References: <20220815065550.1303620-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815065550.1303620-1-mpe@ellerman.id.au>
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
Cc: pali@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 15, 2022 at 04:55:50PM +1000, Michael Ellerman wrote:
> The recent change to get_phb_number() causes a DEBUG_ATOMIC_SLEEP
> warning on some systems:
> 
>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper
>   preempt_count: 1, expected: 0
>   RCU nest depth: 0, expected: 0
>   1 lock held by swapper/1:
>    #0: c157efb0 (hose_spinlock){+.+.}-{2:2}, at: pcibios_alloc_controller+0x64/0x220
>   Preemption disabled at:
>   [<00000000>] 0x0
>   CPU: 0 PID: 1 Comm: swapper Not tainted 5.19.0-yocto-standard+ #1
>   Call Trace:
>   [d101dc90] [c073b264] dump_stack_lvl+0x50/0x8c (unreliable)
>   [d101dcb0] [c0093b70] __might_resched+0x258/0x2a8
>   [d101dcd0] [c0d3e634] __mutex_lock+0x6c/0x6ec
>   [d101dd50] [c0a84174] of_alias_get_id+0x50/0xf4
>   [d101dd80] [c002ec78] pcibios_alloc_controller+0x1b8/0x220
>   [d101ddd0] [c140c9dc] pmac_pci_init+0x198/0x784
>   [d101de50] [c140852c] discover_phbs+0x30/0x4c
>   [d101de60] [c0007fd4] do_one_initcall+0x94/0x344
>   [d101ded0] [c1403b40] kernel_init_freeable+0x1a8/0x22c
>   [d101df10] [c00086e0] kernel_init+0x34/0x160
>   [d101df30] [c001b334] ret_from_kernel_thread+0x5c/0x64
> 
> This is because pcibios_alloc_controller() holds hose_spinlock but
> of_alias_get_id() takes of_mutex which can sleep.
> 
> The hose_spinlock protects the phb_bitmap, and also the hose_list, but
> it doesn't need to be held while get_phb_number() calls the OF routines,
> because those are only looking up information in the device tree.
> 
> So fix it by having get_phb_number() take the hose_spinlock itself, only
> where required, and then dropping the lock before returning.
> pcibios_alloc_controller() then needs to take the lock again before the
> list_add() but that's safe, the order of the list is not important.
> 
> Fixes: 0fe1e96fef0a ("powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

The problem is no longer seen with this patch applied.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
