Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5A802811
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 22:50:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QbLxXmHL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sk0pS2VRmz3dRY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 08:50:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QbLxXmHL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SjxmB1mQBz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 06:33:12 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5cbcfdeaff3so44357627b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Dec 2023 11:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701631990; x=1702236790; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmvgTcSgTSYSGQ9OhXSlfMgozAivgkoJ1Cnrtk56obw=;
        b=QbLxXmHLHCD20oBfIu/CVwUJ72rB/aM2JyuY+iOLgkVjwSy9+MCmqreWwFw3U77px8
         MNbyb7FJN/03l0aEeBiHSjMB1Xf/AesM793wTn2rqg6uCRugOJ1teU51OuYyxHcN0V2r
         rbOwebnaAqw1JGh2PxP8WXNos2QQbv94ZTsSdW3fUWda2yOO5sWrFTksOm3yD7NdMYrv
         Etb02y1KYJw6HFzgTk82enCgIm6qwSGEjptP9p4aOexde73IulRgrCxg9x+zBgn5Ikjw
         OPYnLnVm8R5e1YfPcIznrK9DyDal+mBhM9n9iHE6yFWbfwjxjY5gmI8P7IFUtTRs200K
         jADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701631990; x=1702236790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmvgTcSgTSYSGQ9OhXSlfMgozAivgkoJ1Cnrtk56obw=;
        b=snu+pByC9fHqVg0dw7si6WnjxpzP5nPWXR9IvGe7zdc9TyaLfGsH2jrZU5j/EuHwlm
         ZF8aFaPgu9w9rpZma5SiribiNMHwH8Idaemsqtg0gMz3N01NvRtE8kDyJmV504pKsg16
         9HKQ6avMSXU8lxLCWbYKQKfmL4tfQSM9kox+qS/JVVrYqt46khaP7M5VJKMmQFyNcfXT
         whxPRqiXz66s3TULq7uIxxxqcRmaieIiH5n+71NVJd6z1ohsL7h8kr1ojFtgk6CcgirF
         0PfR+R3qaIQotXQ/lwJDqZjMzG+ECVn10FiUQkgOCt5i6sB30QCN8o7ap4aPyDoJ2ZMC
         Gfzg==
X-Gm-Message-State: AOJu0YzF9AaDZNHv3D+3doW7WfzYwP49UXGZ32A/5BvFG5xo4ObsdlUo
	31r3mPc3ESyZmwAI4kB4BDU=
X-Google-Smtp-Source: AGHT+IH9dK5SBG1KTg95TkMNRGGX2LRFyEvXVyFKexhpvkq8MjiOjaHQrHY4kI3iqaUaVcCxIhY+og==
X-Received: by 2002:a05:690c:c11:b0:5d1:6370:b2cf with SMTP id cl17-20020a05690c0c1100b005d16370b2cfmr2746902ywb.29.1701631990366;
        Sun, 03 Dec 2023 11:33:10 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:cb98:c3e:57c:8191])
        by smtp.gmail.com with ESMTPSA id d143-20020a814f95000000b005d795822dc7sm1042135ywb.35.2023.12.03.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 11:33:09 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Disseldorp <ddiss@suse.de>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Jiri Pirko <jiri@resnulli.us>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Karsten Graul <kgraul@linux.ibm.com>,
	Karsten Keil <isdn@linux-pingi.de>,
	Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oliver Neukum <oneukum@suse.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Rich Felker <dalias@libc.org>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wenjia Zhang <wenjia@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	GR-QLogic-Storage-Upstream@marvell.com,
	alsa-devel@alsa-project.org,
	ath10k@lists.infradead.org,
	dmaengine@vger.kernel.org,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 02/35] lib/find: add test for atomic find_bit() ops
Date: Sun,  3 Dec 2023 11:32:34 -0800
Message-Id: <20231203193307.542794-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203192422.539300-1-yury.norov@gmail.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Dec 2023 08:48:06 +1100
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Jan Kara <jack@suse.cz>, Bart Van Assche <bvanassche@acm.org>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <klimov.linux@gmail.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add basic functionality test for new API.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 lib/test_bitmap.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 65f22c2578b0..277e1ca9fd28 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -221,6 +221,65 @@ static void __init test_zero_clear(void)
 	expect_eq_pbl("", bmap, 1024);
 }
 
+static void __init test_find_and_bit(void)
+{
+	unsigned long w, w_part, bit, cnt = 0;
+	DECLARE_BITMAP(bmap, EXP1_IN_BITS);
+
+	/*
+	 * Test find_and_clear{_next}_bit() and corresponding
+	 * iterators
+	 */
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+
+	for_each_test_and_clear_bit(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(w, cnt);
+	expect_eq_uint(0, bitmap_weight(bmap, EXP1_IN_BITS));
+
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+	w_part = bitmap_weight(bmap, EXP1_IN_BITS / 3);
+
+	cnt = 0;
+	bit = EXP1_IN_BITS / 3;
+	for_each_test_and_clear_bit_from(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(bitmap_weight(bmap, EXP1_IN_BITS), bitmap_weight(bmap, EXP1_IN_BITS / 3));
+	expect_eq_uint(w_part, bitmap_weight(bmap, EXP1_IN_BITS));
+	expect_eq_uint(w - w_part, cnt);
+
+	/*
+	 * Test find_and_set{_next}_bit() and corresponding
+	 * iterators
+	 */
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+	cnt = 0;
+
+	for_each_test_and_set_bit(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(EXP1_IN_BITS - w, cnt);
+	expect_eq_uint(EXP1_IN_BITS, bitmap_weight(bmap, EXP1_IN_BITS));
+
+	bitmap_copy(bmap, exp1, EXP1_IN_BITS);
+	w = bitmap_weight(bmap, EXP1_IN_BITS);
+	w_part = bitmap_weight(bmap, EXP1_IN_BITS / 3);
+	cnt = 0;
+
+	bit = EXP1_IN_BITS / 3;
+	for_each_test_and_set_bit_from(bit, bmap, EXP1_IN_BITS)
+		cnt++;
+
+	expect_eq_uint(EXP1_IN_BITS - bitmap_weight(bmap, EXP1_IN_BITS),
+			EXP1_IN_BITS / 3 - bitmap_weight(bmap, EXP1_IN_BITS / 3));
+	expect_eq_uint(EXP1_IN_BITS * 2 / 3 - (w - w_part), cnt);
+}
+
 static void __init test_find_nth_bit(void)
 {
 	unsigned long b, bit, cnt = 0;
@@ -1273,6 +1332,8 @@ static void __init selftest(void)
 	test_for_each_clear_bitrange_from();
 	test_for_each_set_clump8();
 	test_for_each_set_bit_wrap();
+
+	test_find_and_bit();
 }
 
 KSTM_MODULE_LOADERS(test_bitmap);
-- 
2.40.1

