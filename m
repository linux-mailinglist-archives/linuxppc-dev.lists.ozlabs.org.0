Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D630323D51E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 03:32:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMWDw1Dt8zDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 11:32:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMWC43FDhzDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 11:30:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mHcR4hHu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMWC36F2Hz9sTM;
 Thu,  6 Aug 2020 11:30:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596677423;
 bh=uAEVqRzEBZmo3V8axbDuKnHbDG9MYxXJg1swCiNr1Dc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=mHcR4hHu4ohH0+qitZE9C5UVFBBrupAhoZFE5G0rp9ZhBnrnwVlpCjDNG+U6SHili
 E5yLjHBnr0ezgMEGNOdM8MDzKGu8h/brWa2gJlAMY4x1VzjI039AznLPsPcOfOyEpG
 Eb5LGQoHEko9Z08QW5dmEgUr9rUhMl/vBKudwAOyV/yjtfz2D/Nt7eXCIsGtt5AJRT
 TRtX+epGRZXlQnfRhL0+sORS3UXupShq6MoFOwC+QpnIXYDcgM5hjrEyTh265mHAy8
 5xgaqVwxvzgCT9XbdRu6r6KaZNUF0wNBg+uIEWxXzC8DFKYgeVitHdI7zyVgBU69VR
 FxVYnvFkZtreA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: thefirst ECS <ecs_dn@yahoo.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: How would I code a Write to a proc file from within the kernel
 without reading anything from user space?
In-Reply-To: <32112832.26959.1596664366002.JavaMail.Dan@DanHP>
References: <32112832.26959.1596664366002.JavaMail.Dan.ref@DanHP>
 <32112832.26959.1596664366002.JavaMail.Dan@DanHP>
Date: Thu, 06 Aug 2020 11:30:20 +1000
Message-ID: <87tuxgy30z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

thefirst ECS <ecs_dn@yahoo.com> writes:
> In order to help debug a certain discrepancy, I need to "simulate" an "echo 1 > /proc/file" but doing it from kernel even when root file system is unavailable. 
>
> I have simulated it just fine via call_usermodehelper (with argv etc of "echo 1 > /proc/file") from inside the kernel which triggers:
> [ee897ec0] [c0122704] proc_reg_write+0x80/0xb4
> [ee897ef0] [c00d3b7c] vfs_write+0xb4/0x184
>
> just as I had wanted. But now I need to trigger the "vfs_write" and "proc_reg_write" but without using call_usermodehelper since I will be doing it when root "/" is unavailable and so I can no longer access /bin/echo and call the usermodehelper etc. So my question is how can I do that in kernel?
>
> Not sure if I'm supposed to look in fs read_write.c and fs.h and write a method based on those or if there's some other way etc.

You don't say which proc file, which would be useful information.

I'll assume it's /proc/sysrq-trigger based on your previous mail.

Rather than trying to invoke the write path from inside the kernel, the
simplest option is to just call __handle_sysrq() directly.

cheers
