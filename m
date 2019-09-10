Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDDAEDDF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:55:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SSkF5BKSzDr7Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 00:55:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=hammerspace.com
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SSfq5gfYzF0dc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 00:52:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SSfg4bygz9tyfH;
 Tue, 10 Sep 2019 16:51:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KXm1t-ZnXWpN; Tue, 10 Sep 2019 16:51:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SSfg0PKyz9tyfF;
 Tue, 10 Sep 2019 16:51:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CDC68B88B;
 Tue, 10 Sep 2019 16:51:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3u6XCYj-DB3d; Tue, 10 Sep 2019 16:51:56 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 558258B885;
 Tue, 10 Sep 2019 16:51:56 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 30D986B750; Tue, 10 Sep 2019 14:51:56 +0000 (UTC)
Message-Id: <eb3d8f42231aec65b64b079dd17bd6c008a3fe29.1568127106.git.christophe.leroy@c-s.fr>
From: Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [PATCH v2 1/2] NFS: Fix inode fileid checks in attribute revalidation
 code
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 10 Sep 2019 14:51:56 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We want to throw out the attrbute if it refers to the mounted on fileid,
and not the real fileid. However we do not want to block cache consistency
updates from NFSv4 writes.

Reported-by: Murphy Zhou <jencce.kernel@gmail.com>
Fixes: 7e10cc25bfa0 ("NFS: Don't refresh attributes with mounted-on-file...")
Signed-off-by: Trond Myklebust <trond.myklebust@hammerspace.com>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 fs/nfs/inode.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index c764cfe456e5..2a03bfeec10a 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -1403,11 +1403,12 @@ static int nfs_check_inode_attributes(struct inode *inode, struct nfs_fattr *fat
 	if (NFS_PROTO(inode)->have_delegation(inode, FMODE_READ))
 		return 0;
 
-	/* No fileid? Just exit */
-	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
-		return 0;
+	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
+		/* Only a mounted-on-fileid? Just exit */
+		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
+			return 0;
 	/* Has the inode gone and changed behind our back? */
-	if (nfsi->fileid != fattr->fileid) {
+	} else if (nfsi->fileid != fattr->fileid) {
 		/* Is this perhaps the mounted-on fileid? */
 		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID) &&
 		    nfsi->fileid == fattr->mounted_on_fileid)
@@ -1807,11 +1808,12 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 			nfs_display_fhandle_hash(NFS_FH(inode)),
 			atomic_read(&inode->i_count), fattr->valid);
 
-	/* No fileid? Just exit */
-	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID))
-		return 0;
+	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID)) {
+		/* Only a mounted-on-fileid? Just exit */
+		if (fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID)
+			return 0;
 	/* Has the inode gone and changed behind our back? */
-	if (nfsi->fileid != fattr->fileid) {
+	} else if (nfsi->fileid != fattr->fileid) {
 		/* Is this perhaps the mounted-on fileid? */
 		if ((fattr->valid & NFS_ATTR_FATTR_MOUNTED_ON_FILEID) &&
 		    nfsi->fileid == fattr->mounted_on_fileid)
-- 
2.13.3

