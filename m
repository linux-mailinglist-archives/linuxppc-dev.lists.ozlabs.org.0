Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAF68ABA6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 18:31:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8KLs3Nv9z3cFt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 04:31:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EP8/5r6W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EP8/5r6W;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8KL00jpqz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 04:30:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FmaB9wGVzKgv4NzbcyWLZghEkZJWFbWTGJ/aQuSwubg=; b=EP8/5r6WhreemW5wKjlg11SOGG
	twLmJZVw9U4pyd1XXvZ4OQCO6gS64umcu2mXWdQcrROs9Pbn5XYAckSkFYrJu3Eq4CID/i/KXO2lb
	ao+lvXCRLhDNTCD2vp+gbVYXJCpI9w0WGTcbhEqYsawNnqhMTUiSvF9PqMH5ZnZtgmI8SqYH0ttK+
	4Sul2QJK3Nkd/6Z+I7wgdta0sWKUsbsRg0NMoR3iGg/VNlzP77042PvTuQuvtrG9g6U9IqEGyAppV
	bb4SbV65DpeMmO9u6VGvF/PJKUlE6g3nJqGTcZvBgIPkUGmoTSKVG/dcov/MwGQMLQBd3KHGCmCLh
	3iAsqcag==;
Received: from [2601:1c2:d00:6a60::9526]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOMMv-005RSp-Ce; Sat, 04 Feb 2023 17:30:29 +0000
Message-ID: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
Date: Sat, 4 Feb 2023 09:30:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: PPC64 TOC. warnings
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I'm seeing thousands of these warnings:
(gcc 12.2.0)


./include/generated/autoksyms.h:7:9: warning: ISO C99 requires whitespace after the macro name
    7 | #define __KSYM_TOC. 1
      |         ^~~~~~~~~~

In file included from ../include/asm-generic/export.h:57,
                 from ./arch/powerpc/include/generated/asm/export.h:1,
                 from ../arch/powerpc/kernel/misc.S:17:
./include/generated/autoksyms.h:7:9: warning: missing whitespace after the macro name
    7 | #define __KSYM_TOC. 1
      |         ^~~~~~~~~~


Can anything be done about them?

Thanks.
-- 
~Randy
