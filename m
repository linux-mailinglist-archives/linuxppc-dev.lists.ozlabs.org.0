Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA88784B49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 22:21:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kNmyLNVW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVgj91vBsz3c50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 06:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kNmyLNVW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVghF3gSlz2xdl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 06:20:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7/LTW4ARO//V3xdtFM8fbiG79s90dMawsmxlv8Tdz4s=; b=kNmyLNVWTPJyo1gYbyI29XsPB0
	R8OlJ9zgFHoPYUPIUnzeoLu5thoaCMOb639NKhxPvFvNAkhfiZBydiHMLBi5wH54PABEhZUmR/E1C
	DBuv7+QNmYXDQInS0dmtd24GYu6gL88QDIdGrnAPYwooLwcfdJWevbwPty7OdKQHCXvs5TfgxB/8J
	jhTNNBPWQlDb/FDzjGvsV+vJjW5DtBg91H3/2ZqNCPSAaJgV4wJhzqPEMoC4p9gE6o/gvby4SpJ6Q
	NzUdAU1x9weXyRtQmoE8LdqziEL4bR7Cd71pThbbpEsyjyUeFFPEhVYVFkaQymoZMtZ9ICsZp7+t6
	+TS4RwgQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qYXrG-000iCR-H4; Tue, 22 Aug 2023 20:20:10 +0000
Date: Tue, 22 Aug 2023 21:20:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <ZOUYekbtTv+n8hYf@casper.infradead.org>
References: <20230822095537.500047f7@canb.auug.org.au>
 <ZOQLUMBB7amLUJLY@casper.infradead.org>
 <20230822112217.185c3357@canb.auug.org.au>
 <ZOQQjmxeLM920/Q/@casper.infradead.org>
 <20230822040043.GB11263@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822040043.GB11263@frogsfrogsfrogs>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-xfs@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 21, 2023 at 09:00:43PM -0700, Darrick J. Wong wrote:
> Please leave this ^^^ comment, because the need for TRACE_DEFINE_ENUM to
> make enums work in tracepoints is not at all obvious.
> 
> "order %u" to match the (non dev_t) style of the rest of the xfs
> tracepoints.

ACK, thanks.

Andrew, please add this -fix patch for "mm: Remove enum
page_entry_size".

diff --git a/fs/xfs/xfs_trace.h b/fs/xfs/xfs_trace.h
index 1904eaf7a2e9..fd789e00dfd6 100644
--- a/fs/xfs/xfs_trace.h
+++ b/fs/xfs/xfs_trace.h
@@ -802,9 +802,6 @@ DEFINE_INODE_EVENT(xfs_inode_inactivating);
  * ring buffer.  Somehow this was only worth mentioning in the ftrace sample
  * code.
  */
-TRACE_DEFINE_ENUM(PMD_ORDER);
-TRACE_DEFINE_ENUM(PUD_ORDER);
-
 TRACE_DEFINE_ENUM(XFS_REFC_DOMAIN_SHARED);
 TRACE_DEFINE_ENUM(XFS_REFC_DOMAIN_COW);
 
@@ -823,13 +820,10 @@ TRACE_EVENT(xfs_filemap_fault,
 		__entry->order = order;
 		__entry->write_fault = write_fault;
 	),
-	TP_printk("dev %d:%d ino 0x%llx %s write_fault %d",
+	TP_printk("dev %d:%d ino 0x%llx order %u write_fault %d",
 		  MAJOR(__entry->dev), MINOR(__entry->dev),
 		  __entry->ino,
-		  __print_symbolic(__entry->order,
-			{ 0,		"PTE" },
-			{ PMD_ORDER,	"PMD" },
-			{ PUD_ORDER,	"PUD" }),
+		  __entry->order,
 		  __entry->write_fault)
 )
 
