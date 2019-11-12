Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEDBF8580
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 01:41:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bppn0RdNzF4nS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 11:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65; helo=hqemgate16.nvidia.com;
 envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="Daw1gXi5"; 
 dkim-atps=neutral
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bp345YsRzF4MP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 11:07:28 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7810002>; Mon, 11 Nov 2019 16:06:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:21 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:21 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:21 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:20 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b60003>; Mon, 11 Nov 2019 16:07:19 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 15/23] net/xdp: set FOLL_PIN via pin_user_pages()
Date: Mon, 11 Nov 2019 16:06:52 -0800
Message-ID: <20191112000700.3455038-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573517185; bh=7NW5FVByU2q47q8YXJg0DLnVCFYBzjS19tQtlG28KDY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Daw1gXi5Nf8jhwQGkFuKATjIjdGTo/8QHCXHZE7HOCQsxIKzJaEMCfUmt1gepoDlz
 wAtZERC/OIZdJ+dC7qyRHHNRHe+c8VRZ6WxtX0ujRzrLUzUNNhd/2aUReq75nVQOnB
 hXYlG0kMXNbnL0FAO1VMoSv0HZQiFBzWo/Le+8G03Vf47g41hmlrLcQOpTobmPcOfd
 3gyGQm9Q39Wz3SpcrYOGhVOaHpFtHfuoItD2ZOM8vvYKso23c3EiSIlN3hYPQ0r19n
 XdosFXuIQ6dG3YNzHqIrFPxXBYW8pEAU+rzMaRN4Ou24/T3o3hVX/yxtTg/YPDbivh
 8HR5xsqA3ACUQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert net/xdp to use the new pin_longterm_pages() call, which sets
FOLL_PIN. Setting FOLL_PIN is now required for code that requires
tracking of pinned pages.

In partial anticipation of this work, the net/xdp code was already
calling put_user_page() instead of put_page(). Therefore, in order to
convert from the get_user_pages()/put_page() model, to the
pin_user_pages()/put_user_page() model, the only change required
here is to change get_user_pages() to pin_longterm_pages().

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Acked-by: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 net/xdp/xdp_umem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index 3049af269fbf..66c814863cfd 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -291,8 +291,8 @@ static int xdp_umem_pin_pages(struct xdp_umem *umem)
 		return -ENOMEM;
=20
 	down_read(&current->mm->mmap_sem);
-	npgs =3D get_user_pages(umem->address, umem->npgs,
-			      gup_flags | FOLL_LONGTERM, &umem->pgs[0], NULL);
+	npgs =3D pin_longterm_pages(umem->address, umem->npgs, gup_flags,
+				  &umem->pgs[0], NULL);
 	up_read(&current->mm->mmap_sem);
=20
 	if (npgs !=3D umem->npgs) {
--=20
2.24.0

