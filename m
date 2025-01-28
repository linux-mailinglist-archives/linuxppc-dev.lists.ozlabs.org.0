Return-Path: <linuxppc-dev+bounces-5646-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603A5A20EF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 17:47:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjB5h3sswz30HB;
	Wed, 29 Jan 2025 03:47:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738082824;
	cv=none; b=MkQ497WT3idzk9eKUQQ8LYFhRNGtjibCjM1dEMqhkaSeSleOQZZVmtcuQnV73OXp8tu2vImdmLqw4MuGMz2HhpRGeayX3Qf/i6LlUGH1g6nted9uC0tGkhb0bgHKE8ze15CNQY1G9ST9z7XvyDXpHlNIsKRGIeIUkq9/g9Vhwc115GejDnuX9IFCE0b5EKTrIBizQNWjg5orMF+GCNq/xysf8VvlWSv1xKC4UrHurjNifhglATn2U3yhYC403uBZ42jxYkZUU33mcg50pibucftlsaA06PAqhS8twrGp9znXh23AYSl5A6Dd+7/vOIwH1UqvDSUL4DZeHOKrFlv1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738082824; c=relaxed/relaxed;
	bh=mPo0Qmhd/LgFOJoY/TurPrp2onCgGxY+Z0rc3zytFz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YH8HC1UUZ0rUAGHxFahxGtpuwcvn4t6K+CvZ9WsM11GtMz6PszEH3rZKB2MetNnoF7bq7VkTBYhNN/+6zzGB/Qn4p4sODLnkZZdfzQmZH7r5GWuLa5R7zQhGbFfPmmBO/0lwAddcUoXU/2cXE3xSYtPp1rYTvvU67eNxw3GHh+PfnzLYV0QJ11Ji5qrRX7pfb+1ee7gEUQBKi1RaZDoA166rEJG++6cTri7rOVFWmqdg+Krsw51Y8q3SdJOTfNyxGMwa3RJbjxV7ZrthorbpZICuVPZqwJX4veTymLva0JrVn5t/zkcUkXPTiolIarH2QiMT7w5UzK6VrafzZuwfhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y/mpiZ5W; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y/mpiZ5W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjB5g4rPlz306S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 03:47:03 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e589c258663so977725276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 08:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738082821; x=1738687621; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPo0Qmhd/LgFOJoY/TurPrp2onCgGxY+Z0rc3zytFz4=;
        b=Y/mpiZ5WzM3MoDUXShBIeX5PhEji/rFmnQsRhgmjTVus7tOrqGhJebzpWTH7X8tpwJ
         KNl0gS7jwF83zDmwY7nsaqws7Wlckjbvl6YjjJJFWaTEyhZ/dbZa+ZR84Pk8wjq268mQ
         zKN2UOtif7WxZOPnp2nTu9CC8l4mBcpI6Rd958aAK/nYMsSQBMnZt31ZiAKPp/3N+pdv
         Yu1uTYPSVjTvvtibDXhPsvOrCcknSCfIGkWfgZBmca9W/k+3g87zW5Jxye2FizmfVPRI
         2P4ApvDVNbXdxqdtdZ7ZwT8jVq4djsjzPYiPZX0lnAvA0arr2F8t68DkUF+aInKwoa0C
         +Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082821; x=1738687621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPo0Qmhd/LgFOJoY/TurPrp2onCgGxY+Z0rc3zytFz4=;
        b=ECvcAF6/7egjXvzYvj2Bd/qH/PgCiwDjNqIoi/4IdQsOFzWBLpDFhfLMJusjKL1yJw
         tUlDzWEFdx5TxwcoB8BaRsfPX1WIo40r8cQpErBOPusdPfsa/N+29iNdxKjGZ7eQJqMU
         bJeh1ibfbX8ReRMwTmj2KhlZ+UBv8tGXXa6pJCW5CVVBS2tzN3rGltWGkS1Ys6Va3Sed
         o5pjQKy5M9X5e7zk/vLRje/fMJYZZGtBYJgD9RaAmoRPZeOtRI5OKrZw+81rLfhGLtej
         4WAvMnyv0+Yk4ZSh3A/n3VjK7jsxXcmw1P5NzWifj5GxdKYaGRDtrE/vCyMFg2hcWxPX
         SXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGGPmzAr+hGzDJBtvXuZO7Pig3PFFvajpPpmQDRvo9CTUAYRkOXpmyXQSXeuTJJz/XD/JDXXxByi7o61c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWzyYJp+E0u69y8X/gjV+nRR3gMFRdX/P88Cg/sVkn0ylaVZyh
	uTKnhmSLdmwh9Mdl6Nkp+q4NzTVGg2Xsgrd/8rDaBybqXqPAoZ9r
X-Gm-Gg: ASbGnctSA66nNUQUSH8aoY+l8LCNSdOCPVmEg+1pZAYinCQhyY/FrBMYxiJ7W0s1Xbp
	xfVRIuqf7ODEsmfstaXw29xBb2oIaWdEsNM82/ZEIKZCvNX55CMkJVQgkQFtEWkE5Ye/sxWuCT1
	wmKPUZxtSet0KsZtuzgtOaqSmKc3TZMROrFhlc384rKM/DbcMpUuG4gUxUxMx6Tln41N6tc+bYN
	RzFwvwmKOd7bV/ZoP41nobrC1g23epLCMsgdUHXwb7srBYBA3u14F+WtYEOEQReOOF+SEaKeB2d
	uaPL94A51YsKWF9cRvy+sb54lvP4Sg5ALtoW9SyQLaQQ5xrZUE8=
X-Google-Smtp-Source: AGHT+IEbCDwztaXs4775wdhVhgVxaydy6EUMlQBUSRYIasXW3lx4ypNqxsjWkznwG36W84zpcNPfgw==
X-Received: by 2002:a05:6902:982:b0:e58:306f:e83a with SMTP id 3f1490d57ef6-e58306fe89cmr14077851276.29.1738082820769;
        Tue, 28 Jan 2025 08:47:00 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e589a2260a9sm196205276.37.2025.01.28.08.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 08:47:00 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Matt Wu <wuqiang.matt@bytedance.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kurz <groug@kaod.org>,
	Peter Xu <peterx@redhat.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2 06/13] cpumask: re-introduce cpumask_next{,_and}_wrap()
Date: Tue, 28 Jan 2025 11:46:35 -0500
Message-ID: <20250128164646.4009-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128164646.4009-1-yury.norov@gmail.com>
References: <20250128164646.4009-1-yury.norov@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

cpumask_next_wrap_old() has two additional parameters, comparing to its
generic counterpart find_next_bit_wrap(). The reason for that is
historical.

Before 4fe49b3b97c262 ("lib/bitmap: introduce for_each_set_bit_wrap()
macro"), cpumask_next_wrap() was used to implement for_each_cpu_wrap()
iterator. Now that the iterator is an alias to generic
for_each_set_bit_wrap(), the additional parameters aren't used and may
confuse readers.

All existing users call cpumask_next_wrap() in a way that makes it
possible to turn it to straight and simple alias to find_next_bit_wrap().

In a couple of places kernel users opencode missing cpumask_next_and_wrap().
Add it as well.

CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index b267a4f6a917..4f3d8d66e86e 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -284,6 +284,44 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
 		small_cpumask_bits, n + 1);
 }
 
+/**
+ * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
+ *			   @n+1. If nothing found, wrap around and start from
+ *			   the beginning
+ * @n: the cpu prior to the place to search (i.e. search starts from @n+1)
+ * @src1p: the first cpumask pointer
+ * @src2p: the second cpumask pointer
+ *
+ * Return: next set bit, wrapped if needed, or >= nr_cpu_ids if @src1p & @src2p is empty.
+ */
+static __always_inline
+unsigned int cpumask_next_and_wrap(int n, const struct cpumask *src1p,
+			      const struct cpumask *src2p)
+{
+	/* -1 is a legal arg here. */
+	if (n != -1)
+		cpumask_check(n);
+	return find_next_and_bit_wrap(cpumask_bits(src1p), cpumask_bits(src2p),
+		small_cpumask_bits, n + 1);
+}
+
+/**
+ * cpumask_next_wrap - get the next cpu in *src, starting from @n+1. If nothing
+ *		       found, wrap around and start from the beginning
+ * @n: the cpu prior to the place to search (i.e. search starts from @n+1)
+ * @src: cpumask pointer
+ *
+ * Return: next set bit, wrapped if needed, or >= nr_cpu_ids if @src is empty.
+ */
+static __always_inline
+unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
+{
+	/* -1 is a legal arg here. */
+	if (n != -1)
+		cpumask_check(n);
+	return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
+}
+
 /**
  * for_each_cpu - iterate over every cpu in a mask
  * @cpu: the (optionally unsigned) integer iterator
-- 
2.43.0


