Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E130121EC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 00:09:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cH6M04spzDq9W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 10:09:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.65;
 helo=hqnvemgate26.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="ipUKROua"; 
 dkim-atps=neutral
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cG7x2WPDzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 09:26:02 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8045d0002>; Mon, 16 Dec 2019 14:25:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 14:25:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 16 Dec 2019 14:25:42 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:41 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 22:25:41 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df804650004>; Mon, 16 Dec 2019 14:25:41 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 21/25] mm/gup_benchmark: use proper FOLL_WRITE flags
 instead of hard-coding "1"
Date: Mon, 16 Dec 2019 14:25:33 -0800
Message-ID: <20191216222537.491123-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216222537.491123-1-jhubbard@nvidia.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576535133; bh=QtH6vY6OEO3Be/+XPl0nLNSuin0ZowwCu4OyNgllrWs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=ipUKROuaRhOUwigc8Y92jCYwr+O2agysriz835cn/x0NmJMR2VX8WJlN1HjP0wEoC
 yHatSg9uf87R8hOvY/JCyOt6sc2Sw064NFUeptqY4N0z9GF81AWMlv31QiMcszYM02
 xqs5QshE1UlrtM3wJtWlJr5zVSEA+mKyJLWipnuy50YYNLPtbfKSgRgp75TTWlic2H
 8O+1YKA6bJZIjnQrd1yIYT4xuwRatSLHmPWSDkSC8T0g+XDTKrEBbEckofkJB+hBMD
 3OuehKJnQnrTyX7MJJHSY0GcfD35B8a1rjjBumii4TMVVxaFDpX1ctCh4+x0gYI82l
 yvPWHTxZCWsuQ==
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

Fix the gup benchmark flags to use the symbolic FOLL_WRITE,
instead of a hard-coded "1" value.

Also, clean up the filtering of gup flags a little, by just doing
it once before issuing any of the get_user_pages*() calls. This
makes it harder to overlook, instead of having little "gup_flags & 1"
phrases in the function calls.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/gup_benchmark.c                         | 9 ++++++---
 tools/testing/selftests/vm/gup_benchmark.c | 6 +++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 7dd602d7f8db..7fc44d25eca7 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -48,18 +48,21 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 			nr =3D (next - addr) / PAGE_SIZE;
 		}
=20
+		/* Filter out most gup flags: only allow a tiny subset here: */
+		gup->flags &=3D FOLL_WRITE;
+
 		switch (cmd) {
 		case GUP_FAST_BENCHMARK:
-			nr =3D get_user_pages_fast(addr, nr, gup->flags & 1,
+			nr =3D get_user_pages_fast(addr, nr, gup->flags,
 						 pages + i);
 			break;
 		case GUP_LONGTERM_BENCHMARK:
 			nr =3D get_user_pages(addr, nr,
-					    (gup->flags & 1) | FOLL_LONGTERM,
+					    gup->flags | FOLL_LONGTERM,
 					    pages + i, NULL);
 			break;
 		case GUP_BENCHMARK:
-			nr =3D get_user_pages(addr, nr, gup->flags & 1, pages + i,
+			nr =3D get_user_pages(addr, nr, gup->flags, pages + i,
 					    NULL);
 			break;
 		default:
diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/sel=
ftests/vm/gup_benchmark.c
index 485cf06ef013..389327e9b30a 100644
--- a/tools/testing/selftests/vm/gup_benchmark.c
+++ b/tools/testing/selftests/vm/gup_benchmark.c
@@ -18,6 +18,9 @@
 #define GUP_LONGTERM_BENCHMARK	_IOWR('g', 2, struct gup_benchmark)
 #define GUP_BENCHMARK		_IOWR('g', 3, struct gup_benchmark)
=20
+/* Just the flags we need, copied from mm.h: */
+#define FOLL_WRITE	0x01	/* check pte is writable */
+
 struct gup_benchmark {
 	__u64 get_delta_usec;
 	__u64 put_delta_usec;
@@ -85,7 +88,8 @@ int main(int argc, char **argv)
 	}
=20
 	gup.nr_pages_per_call =3D nr_pages;
-	gup.flags =3D write;
+	if (write)
+		gup.flags |=3D FOLL_WRITE;
=20
 	fd =3D open("/sys/kernel/debug/gup_benchmark", O_RDWR);
 	if (fd =3D=3D -1)
--=20
2.24.1

