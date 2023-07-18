Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84491757703
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 10:48:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=c4byWfxT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4szP37wvz30YS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 18:48:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=c4byWfxT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4syY72cQz301T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 18:47:17 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R4syR2PpyzBR9sm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:47:11 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689670031; x=1692262032; bh=/LH0pQnbYVRnvqCUHOhkQ9PVPu0
	B6RTYRYGFtKomC5A=; b=c4byWfxTuLP7VbGvp+eBajKlNIh5iQM/DQQDGQxB6Jz
	O5ty0+a33IHA89NpkPrQ4EiqyAvYkBac+FCB1gHtrat5kQOaDsJv9gEIXx/+QAd+
	+D84wj3Bj7GOjMPuOfg7joPjrsektfnKFFL0jy9vG9VrEvxKKWlig3Y3NsELsFEh
	Xst0AU6YjQASF8I1ULiaEej/97ySgm1IDARY4RFKbh2jF/cscMJXbjb6rrLjt07y
	wrQMu89ZNox/m4XQZP5Uk4Rxzwk6yNjXNJFMovJf3zAEbM9fF73+PN8mVzJyneie
	gGQok4Kemu2pUocZxEkFjPrpAIMaIBmBL1et+qg5xoQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id j6FzH8PjYxKt for <linuxppc-dev@lists.ozlabs.org>;
	Tue, 18 Jul 2023 16:47:11 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R4syR0qpnzBR7bp;
	Tue, 18 Jul 2023 16:47:11 +0800 (CST)
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 16:47:11 +0800
From: hanyu001@208suo.com
To: geoff@infradead.org
Subject: [PATCH] powerpc: platforms: ps3: Add require space after that ';'
In-Reply-To: <tencent_61CFD504E2AA1B2AEDC779888E686B6AA309@qq.com>
References: <tencent_61CFD504E2AA1B2AEDC779888E686B6AA309@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <5a46daa59b79aa6031cf465f4648c689@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes checkpatch errors:

./arch/powerpc/platforms/ps3/platform.h:198: ERROR: space required after 
that ';' (ctx:VxV)
./arch/powerpc/platforms/ps3/platform.h:200: ERROR: space required after 
that ';' (ctx:VxV)
./arch/powerpc/platforms/ps3/platform.h:202: ERROR: space required after 
that ';' (ctx:VxV)
./arch/powerpc/platforms/ps3/platform.h:204: ERROR: space required after 
that ';' (ctx:VxV)
./arch/powerpc/platforms/ps3/platform.h:206: ERROR: space required after 
that ';' (ctx:VxV)

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/platforms/ps3/platform.h | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/platform.h 
b/arch/powerpc/platforms/ps3/platform.h
index 6beecdb0d51f..715167ab7348 100644
--- a/arch/powerpc/platforms/ps3/platform.h
+++ b/arch/powerpc/platforms/ps3/platform.h
@@ -195,15 +195,15 @@ int ps3_repository_write_highmem_info(unsigned int 
region_index,
  int ps3_repository_delete_highmem_info(unsigned int region_index);
  #else
  static inline int ps3_repository_write_highmem_region_count(
-    unsigned int region_count) {return 0;}
+    unsigned int region_count) {return 0; }
  static inline int ps3_repository_write_highmem_base(unsigned int 
region_index,
-    u64 highmem_base) {return 0;}
+    u64 highmem_base) {return 0; }
  static inline int ps3_repository_write_highmem_size(unsigned int 
region_index,
-    u64 highmem_size) {return 0;}
+    u64 highmem_size) {return 0; }
  static inline int ps3_repository_write_highmem_info(unsigned int 
region_index,
-    u64 highmem_base, u64 highmem_size) {return 0;}
+    u64 highmem_base, u64 highmem_size) {return 0; }
  static inline int ps3_repository_delete_highmem_info(unsigned int 
region_index)
-    {return 0;}
+    {return 0; }
  #endif

  /* repository pme info */
