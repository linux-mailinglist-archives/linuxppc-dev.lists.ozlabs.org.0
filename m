Return-Path: <linuxppc-dev+bounces-4509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC29FDBEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 19:50:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YLBJ02B2cz2ytp;
	Sun, 29 Dec 2024 05:50:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735411808;
	cv=none; b=iTJC0Hvg2eFnsJqM1RmGo+giA1h+zEmEhtt1Vokwju0OvoZK8K6GbjfT1YuPzENjFjhl4i5Eh8uTeBE4KsY93Tr4i/+12xv9ucKr4HPxnrGtimzMDC3PQriy276wWUjt4luY+22iTeYZ1nvmuXsiDaQJLgt7OjTY30dCWLZNtBbCUVBKEIU2fnlsMpxPYNWRmr0VJ1YwIiBU66CHdPge90rfkmxEkidhxZqQ11/IJFjKH6A3tuZMgT1QQ00WfCzzqxaRch6n5z65hTa8kY0EzQ6pt2l0CHr0RIt6qA8alczxKj51b69+gNTrrrUoICcU4RmyjOozW+V3RbwrF/iaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735411808; c=relaxed/relaxed;
	bh=S9g5yzfm32qCCSZ9hYX8RFrDFECwqUd1W8h8dBnaZOA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osOK9jDS7K1BVOopPJwvEuD4EuGY1K1WsNYzyQEcLIyFbKWovXJ7heGLTb2f/IUVf3c4bjI5mlHHZh6adIcnCH7LYLACLXroecyxSi/GPwPN+KXKlcR08P0mGPhN7yxBvftPJ1EEnHgku3mvXVARA33sTk1fLpF7KBwnwN4FR4eZi3t+YaHJeM5PE+sdZOxE4F/k43Ft9S0kpnws073ysXKQpWN9tdqwU7d+/eO9u7z1YU3qMeOuraOBjCWPaJo42nkfOzRxKuf64H/IPKlz9w59AiF0WcPrpezI08uzt39DaDGzFCHFFwFt6BRKvHxpc/uZrhjeqFbMNCbSUNBmuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QSOL16VW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QSOL16VW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YLBHz2Q2Tz2yhM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 05:50:07 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e3990bbe22cso8902418276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 10:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735411804; x=1736016604; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9g5yzfm32qCCSZ9hYX8RFrDFECwqUd1W8h8dBnaZOA=;
        b=QSOL16VWI1UkeSORn1OIuoXxxYPOMuZef3jjB109fKVTM860myebTQHFU52tkrWrJO
         5ctbZXdRkIQRhenjYflD+Jih8f6LC6wvDJ0u1SuZYWit6Q+z3kN7viacDIok7X45SLFn
         D5mdQwAkBbPEF4HUGAYvBTsDwUi6EgxPg/O7VP3Bn8tPsobQ38bdcZYw7ZpID3tRhv/n
         U+QVNANMnpWZG/XPb1dfQw9Ukr5eAOjbgizQ+Yyn0heRKhIwQtJ46XFVtXCPOutxa2MN
         9hpoue0gsWRieutFozFEwzKxDRC+4d9BFZ+qhRp239hAHEDxkVqo2riYNvHVu/UH0nx6
         qmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735411804; x=1736016604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9g5yzfm32qCCSZ9hYX8RFrDFECwqUd1W8h8dBnaZOA=;
        b=VI3gvumLk5IWV3zSH42wjQPwIWsEAIFFEjQ81Q8XwgnRueXB9RLMytWqz0k7V3Jmpk
         0wOWobIK4XNQNu1A6fEdonBSjKXu6e3BHR3gv8O7ScribgYhZIvosayGs143YzK1ZpmZ
         83Xs7Nz5rota8rmDUllAirITwtaTIDO0gP0F05PQkHNzc/lgGMXa5hUgEg7bIR+gZIjb
         S6Hc8vssDK1o92ktvIqI97jib+OUsITp7g/GuHlFg/aQMfG1ReNNP9LqkCX/dMjQ5qyg
         /my2mWOX3rM5O5H0Vw6lGSnorzztM7OJGx1kddgmovapYtynqkgkkHLGHMHjK2CJ4vei
         OCbw==
X-Forwarded-Encrypted: i=1; AJvYcCXOxU/NjunUWGcAFoAMZpOj/40ZEcpNnabdFFlFGPMUZs56ctAYZbja5q0CQw/r4PRMpYZ9LCFBp5uQE7Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWAHubc5hLZUkesmhndo47DW4nXTEc7DLTO8kr1jMT4Avzuu9j
	l+x/j40lc3TkVthOm/NyWjIOpMAQTxXlZEtUt2aS7m4iU1aLZAmG
X-Gm-Gg: ASbGncuVocfwKzdlCw6LL8htVkkvPcVqxhVHlzzk09x6sxBhXbEyrcT470zpxV1gBnw
	GPe6I3Ifq+L3p5EpeG1hCc5SDIFvCN0iy0j1wtp0JQsWExRpUNaztbe6Rwx06Xt79/I/J8EB5Ut
	L4d9v5lDf2lusPegVVvXo//uWHUXUQNALAlfxAJhAK+LhUVQPUfyii74HeU1/lk1REv5OkuQorJ
	oNAjHQvSw7aHgD6srGnhwCdvHxcu7v6n3VpAlpZ4C0q2qtLER6jLcbxz1G+229Ag+8bAhpsGnyq
	VWfSM2hm3ZOeXhhP
X-Google-Smtp-Source: AGHT+IFRAv4ES1nGe5GZzQSCr0JvuQEh3E1vBTb1UadMisfKYeWtlE6qWVQlRiPBMv3C59QKs6b8rQ==
X-Received: by 2002:a25:cc1:0:b0:e53:4d98:7459 with SMTP id 3f1490d57ef6-e538c3cfd9dmr14310782276.40.1735411804331;
        Sat, 28 Dec 2024 10:50:04 -0800 (PST)
Received: from localhost (c-24-129-28-254.hsd1.fl.comcast.net. [24.129.28.254])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cf73675sm5102193276.51.2024.12.28.10.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:50:03 -0800 (PST)
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
Subject: [PATCH 06/14] cpumask: re-introduce cpumask_next{,_and}_wrap()
Date: Sat, 28 Dec 2024 10:49:38 -0800
Message-ID: <20241228184949.31582-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228184949.31582-1-yury.norov@gmail.com>
References: <20241228184949.31582-1-yury.norov@gmail.com>
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

cpumask_next_wrap_old() has two additional parameters, comparing to it's
analogue in linux/find.h find_next_bit_wrap(). The reason for that is
historical.

Before 4fe49b3b97c262 ("lib/bitmap: introduce for_each_set_bit_wrap()
macro"), cpumask_next_wrap() was used to implement for_each_cpu_wrap()
iterator. Now that the iterator is an alias to generic
for_each_set_bit_wrap(), the additional parameters aren't used and may
confuse readers.

All existing users call cpumask_next_wrap() in a way that makes it
possible to turn it to straight and simple alias to find_next_bit_wrap().

In a couple places kernel users opencode missing cpumask_next_and_wrap().
Add it as well.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index b267a4f6a917..18c9908d50c4 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -284,6 +284,43 @@ unsigned int cpumask_next_and(int n, const struct cpumask *src1p,
 		small_cpumask_bits, n + 1);
 }
 
+/**
+ * cpumask_next_and_wrap - get the next cpu in *src1p & *src2p, starting from
+ *			   @n and wrapping around, if needed
+ * @n: the cpu prior to the place to search (i.e. return will be > @n)
+ * @src1p: the first cpumask pointer
+ * @src2p: the second cpumask pointer
+ *
+ * Return: >= nr_cpu_ids if no further cpus set in both.
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
+/*
+ * cpumask_next_wrap - get the next cpu in *src, starting from
+ *			   @n and wrapping around, if needed
+ * @n: the cpu prior to the place to search
+ * @src: cpumask pointer
+ *
+ * Return: >= nr_cpu_ids if no further cpus set in both.
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


