Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898DF851C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 01:21:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BpMV0rbHzF4ZX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 11:21:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="V83Mm/mg"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bp2q12NNzF4Lw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 11:07:14 +1100 (AEDT)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7b00000>; Mon, 11 Nov 2019 16:07:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:10 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:10 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:08 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7ab0000>; Mon, 11 Nov 2019 16:07:08 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 05/23] goldish_pipe: rename local pin_user_pages() routine
Date: Mon, 11 Nov 2019 16:06:42 -0800
Message-ID: <20191112000700.3455038-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573517233; bh=OvCIL0+nr8EQ3ucOYL7z+Bd4Y3AXJzaosdg9/Wp2t2k=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=V83Mm/mgD13wOskCVUg3jXnnwavnPQ3ylc/JhyLve0YbkPqUMMHZTXt9R3Coa9qBI
 80xP6p17NB70zDrJDKM0H06sAl8/jk3I6sztgeF1r+2JvnRlR/gRrgYjRd7k2qYRvF
 +etmspepNCoSfoh6DuJ9/Tl8quVDHw6f0ZMNYbPHAmdMqdIErdjTDHj7kfctfYwHYJ
 JrQM4B4WS9e1j6/4cRSDe44i8Ut0ljDfyI3fIr7hg3xeYD37/uLAn+pj5hfJLOPdfS
 YfZPx8xiCB4HatUs9wFbCohJOTXKLLcrnHTUpGh/cMLJ3coAlt4cJM6JmF3rNz8d1h
 pWma1MKSn5Urw==
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

1. Avoid naming conflicts: rename local static function from
"pin_user_pages()" to "pin_goldfish_pages()".

An upcoming patch will introduce a global pin_user_pages()
function.

Reviewed-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/platform/goldfish/goldfish_pipe.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/goldfish/goldfish_pipe.c b/drivers/platform/g=
oldfish/goldfish_pipe.c
index cef0133aa47a..7ed2a21a0bac 100644
--- a/drivers/platform/goldfish/goldfish_pipe.c
+++ b/drivers/platform/goldfish/goldfish_pipe.c
@@ -257,12 +257,12 @@ static int goldfish_pipe_error_convert(int status)
 	}
 }
=20
-static int pin_user_pages(unsigned long first_page,
-			  unsigned long last_page,
-			  unsigned int last_page_size,
-			  int is_write,
-			  struct page *pages[MAX_BUFFERS_PER_COMMAND],
-			  unsigned int *iter_last_page_size)
+static int pin_goldfish_pages(unsigned long first_page,
+			      unsigned long last_page,
+			      unsigned int last_page_size,
+			      int is_write,
+			      struct page *pages[MAX_BUFFERS_PER_COMMAND],
+			      unsigned int *iter_last_page_size)
 {
 	int ret;
 	int requested_pages =3D ((last_page - first_page) >> PAGE_SHIFT) + 1;
@@ -354,9 +354,9 @@ static int transfer_max_buffers(struct goldfish_pipe *p=
ipe,
 	if (mutex_lock_interruptible(&pipe->lock))
 		return -ERESTARTSYS;
=20
-	pages_count =3D pin_user_pages(first_page, last_page,
-				     last_page_size, is_write,
-				     pipe->pages, &iter_last_page_size);
+	pages_count =3D pin_goldfish_pages(first_page, last_page,
+					 last_page_size, is_write,
+					 pipe->pages, &iter_last_page_size);
 	if (pages_count < 0) {
 		mutex_unlock(&pipe->lock);
 		return pages_count;
--=20
2.24.0

