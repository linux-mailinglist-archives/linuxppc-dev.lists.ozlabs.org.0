Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C493B1BAEDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 22:09:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499wpc63mNzDqD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 06:09:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+7fdffca6c44e2812a750+6091+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499wlb7540zDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 06:06:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Pgt9n10x6KRiZOZPjup3LlEFIcfQcp73LadxpXYth7I=; b=E0W1M6kGW15+PkkUEtMgB3h6eK
 zvty8HW55iWeClU4ZYGl2WaQ95Pu0GPuTFUWPWW+M/4uHlEnWgOtyaqmOEGNmL5qRYbGQOt7oySd+
 cDnfgv50hXyRbRsW4nuk6P3fbjh1ikaTKYXaymykBrLrlu4LrivtFl2Biqwsj+SoJARNPJN68DSlT
 axiTfxFhXHARDUXjsyBdUdSsSyBsHDZay6/aIpo6nvbix42mr8BIuLjN2B8H5a2o3nmnnYlFgVrKZ
 4+MEZoZohIYw5bqiG53gkM8DJA1ab1C50PPCFWU2/2R/Mc5QNrE1boGTpFTw9tVUnTzFzSmEQag4W
 FpCHrxRw==;
Received: from [2001:4bb8:193:f203:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTA1M-000174-F9; Mon, 27 Apr 2020 20:06:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: remove set_fs calls from the coredump code v4
Date: Mon, 27 Apr 2020 22:06:20 +0200
Message-Id: <20200427200626.1622060-1-hch@lst.de>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Kerr <jk@ozlabs.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Eric W . Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

this series gets rid of playing with the address limit in the exec and
coredump code.  Most of this was fairly trivial, the biggest changes are
those to the spufs coredump code.

Changes since v3:
 - fix x86 compilation with x32 in the new version of the signal code
 - split the exec patches into a new series

Changes since v2:
 - don't cleanup the compat siginfo calling conventions, use the patch
   variant from Eric with slight coding style fixes instead.

Changes since v1:
 - properly spell NUL
 - properly handle the compat siginfo case in ELF coredumps

