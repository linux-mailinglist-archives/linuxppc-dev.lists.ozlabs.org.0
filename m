Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C234A7F0328
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 23:49:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rs3LEBgf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXppz0by5z3d9V
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 09:48:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Rs3LEBgf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXdY45phXz3bcJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 02:51:19 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a7c011e113so33661567b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 07:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700322670; x=1700927470; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtFgcsJzlik9FHkciB+wVhA9q1gRoy67qNZRN3dQ8lw=;
        b=Rs3LEBgfYEZgmOPqhmAu7F42qH4j1mF2lBb+wQB58Jpn7fKHt8+QOLPyf3flFZXVTD
         W8h7MRJaGxtJO/nH904qDbFOlp6Hrmtp6vtXmopWwIMa6azvdeSvFfuZ14cIoCAlMR6f
         gM5TW08ysV4lHESOtLseHyOK2PvKZGoeeRwYFVggTMm0a0mYxIw4lZy+1+xn+EUWWtYs
         YDmvG0CqhLDtuGLVqQeDdx1vCkhZ22RlFpl2ZJMNLIA/gOG1oqSI82iy6/v+BiwZwrC9
         SX+2O7tmOLh6zyyAEK5HLQlDYm/9BTtUVMAIaoAVLGzdxtUqdIvtKnGIHr80WMogXmxm
         0t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700322670; x=1700927470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtFgcsJzlik9FHkciB+wVhA9q1gRoy67qNZRN3dQ8lw=;
        b=l1LTEPPU6OWEzC6YF7GrGDeB7k2ZIFK14MD+7aX/Bvlbqx/H9vEDW3q0joRMGj0rfa
         5NwZt6ABK3BozVtG0qKYnHyo7VDRZgHWvQDImjfeuBydWOLEHI4ev5nuh1EcDHHO10G4
         /59j2olmjJV2Q7HvZdBJ+VFVqkuyNqAskJvnBHxJ8JBBGDmfkyG99W3ZTmN5GSYKt1a9
         4qtNfmOFAYLpD0lwb53tBt3btYxKLJLVuQpLdHwZeF/houawmJa5AktG3lYG5PmDJ6p0
         bUep8u7GIAiuiYuUYvi7l1OWIkllcVgeI4jm4yTekydoEP3kkLtvD+7TcLgIIXHhquUU
         3ECw==
X-Gm-Message-State: AOJu0YwLmpY2tbhG8sxfHwfVzKVJkBgiLCx/4WMjgdHl7PLqXxgPERxZ
	/NuTaQtr2DE3g0/ftDzhCp4=
X-Google-Smtp-Source: AGHT+IHUmWgte7gPRldUGsddVvZ0jBBaJ21NuiOWnYAoUu1ELu9emBQdDvxqbio5n2yoz/YHpW+BMw==
X-Received: by 2002:a0d:cbd7:0:b0:5a7:ba17:15ac with SMTP id n206-20020a0dcbd7000000b005a7ba1715acmr3133986ywd.41.1700322669620;
        Sat, 18 Nov 2023 07:51:09 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:48a9:bd4c:868d:dc97])
        by smtp.gmail.com with ESMTPSA id p127-20020a0dcd85000000b005a7bbd713ddsm1151825ywd.108.2023.11.18.07.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:51:08 -0800 (PST)
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
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
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
Subject: [PATCH 01/34] lib/find: add atomic find_bit() primitives
Date: Sat, 18 Nov 2023 07:50:32 -0800
Message-Id: <20231118155105.25678-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118155105.25678-1-yury.norov@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Nov 2023 09:48:14 +1100
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
Cc: Jan Kara <jack@suse.cz>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matthew Wilcox <willy@infradead.org>, Alexey Klimov <klimov.linux@gmail.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add helpers around test_and_{set,clear}_bit() that allow to search for
clear or set bits and flip them atomically.

The target patterns may look like this:

	for (idx = 0; idx < nbits; idx++)
		if (test_and_clear_bit(idx, bitmap))
			do_something(idx);

Or like this:

	do {
		bit = find_first_bit(bitmap, nbits);
		if (bit >= nbits)
			return nbits;
	} while (!test_and_clear_bit(bit, bitmap));
	return bit;

In both cases, the opencoded loop may be converted to a single function
or iterator call. Correspondingly:

	for_each_test_and_clear_bit(idx, bitmap, nbits)
		do_something(idx);

Or:
	return find_and_clear_bit(bitmap, nbits);

Obviously, the less routine code people have write themself, the less
probability to make a mistake.

Those are not only handy helpers but also resolve a non-trivial
issue of using non-atomic find_bit() together with atomic
test_and_{set,clear)_bit().

The trick is that find_bit() implies that the bitmap is a regular
non-volatile piece of memory, and compiler is allowed to use such
optimization techniques like re-fetching memory instead of caching it.

For example, find_first_bit() is implemented like this:

      for (idx = 0; idx * BITS_PER_LONG < sz; idx++) {
              val = addr[idx];
              if (val) {
                      sz = min(idx * BITS_PER_LONG + __ffs(val), sz);
                      break;
              }
      }

On register-memory architectures, like x86, compiler may decide to
access memory twice - first time to compare against 0, and second time
to fetch its value to pass it to __ffs().

When running find_first_bit() on volatile memory, the memory may get
changed in-between, and for instance, it may lead to passing 0 to
__ffs(), which is undefined. This is a potentially dangerous call.

find_and_clear_bit() as a wrapper around test_and_clear_bit()
naturally treats underlying bitmap as a volatile memory and prevents
compiler from such optimizations.

Now that KCSAN is catching exactly this type of situations and warns on
undercover memory modifications. We can use it to reveal improper usage
of find_bit(), and convert it to atomic find_and_*_bit() as appropriate.

The 1st patch of the series adds the following atomic primitives:

	find_and_set_bit(addr, nbits);
	find_and_set_next_bit(addr, nbits, start);
	...

Here find_and_{set,clear} part refers to the corresponding
test_and_{set,clear}_bit function, and suffixes like _wrap or _lock
derive semantics from corresponding find() or test() functions.

For brevity, the naming omits the fact that we search for zero bit in
find_and_set, and correspondingly, search for set bit in find_and_clear
functions.

The patch also adds iterators with atomic semantics, like
for_each_test_and_set_bit(). Here, the naming rule is to simply prefix
corresponding atomic operation with 'for_each'.

All users of find_bit() API, where heavy concurrency is expected,
are encouraged to switch to atomic find_and_bit() as appropriate.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/find.h | 289 +++++++++++++++++++++++++++++++++++++++++++
 lib/find_bit.c       |  85 +++++++++++++
 2 files changed, 374 insertions(+)

diff --git a/include/linux/find.h b/include/linux/find.h
index 5e4f39ef2e72..e8567f336f42 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -32,6 +32,16 @@ extern unsigned long _find_first_and_bit(const unsigned long *addr1,
 extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
 extern unsigned long _find_last_bit(const unsigned long *addr, unsigned long size);
 
+unsigned long _find_and_set_bit(volatile unsigned long *addr, unsigned long nbits);
+unsigned long _find_and_set_next_bit(volatile unsigned long *addr, unsigned long nbits,
+				unsigned long start);
+unsigned long _find_and_set_bit_lock(volatile unsigned long *addr, unsigned long nbits);
+unsigned long _find_and_set_next_bit_lock(volatile unsigned long *addr, unsigned long nbits,
+					  unsigned long start);
+unsigned long _find_and_clear_bit(volatile unsigned long *addr, unsigned long nbits);
+unsigned long _find_and_clear_next_bit(volatile unsigned long *addr, unsigned long nbits,
+				unsigned long start);
+
 #ifdef __BIG_ENDIAN
 unsigned long _find_first_zero_bit_le(const unsigned long *addr, unsigned long size);
 unsigned long _find_next_zero_bit_le(const  unsigned long *addr, unsigned
@@ -460,6 +470,267 @@ unsigned long __for_each_wrap(const unsigned long *bitmap, unsigned long size,
 	return bit < start ? bit : size;
 }
 
+/**
+ * find_and_set_bit - Find a zero bit and set it atomically
+ * @addr: The address to base the search on
+ * @nbits: The bitmap size in bits
+ *
+ * This function is designed to operate in concurrent access environment.
+ *
+ * Because of concurrency and volatile nature of underlying bitmap, it's not
+ * guaranteed that the bit found is the 1st bit in the bitmap. It's also not
+ * guaranteed that if @nbits is returned, the bitmap is empty.
+ *
+ * The function does guarantee that if returned value is in range [0 .. @nbits),
+ * the acquired bit belongs to the caller exclusively.
+ *
+ * Returns: found and set bit, or @nbits if no bits found
+ */
+static inline
+unsigned long find_and_set_bit(volatile unsigned long *addr, unsigned long nbits)
+{
+	if (small_const_nbits(nbits)) {
+		unsigned long val, ret;
+
+		do {
+			val = *addr | ~GENMASK(nbits - 1, 0);
+			if (val == ~0UL)
+				return nbits;
+			ret = ffz(val);
+		} while (test_and_set_bit(ret, addr));
+
+		return ret;
+	}
+
+	return _find_and_set_bit(addr, nbits);
+}
+
+
+/**
+ * find_and_set_next_bit - Find a zero bit and set it, starting from @offset
+ * @addr: The address to base the search on
+ * @nbits: The bitmap nbits in bits
+ * @offset: The bitnumber to start searching at
+ *
+ * This function is designed to operate in concurrent access environment.
+ *
+ * Because of concurrency and volatile nature of underlying bitmap, it's not
+ * guaranteed that the bit found is the 1st bit in the bitmap, starting from @offset.
+ * It's also not guaranteed that if @nbits is returned, the bitmap is empty.
+ *
+ * The function does guarantee that if returned value is in range [@offset .. @nbits),
+ * the acquired bit belongs to the caller exclusively.
+ *
+ * Returns: found and set bit, or @nbits if no bits found
+ */
+static inline
+unsigned long find_and_set_next_bit(volatile unsigned long *addr,
+				    unsigned long nbits, unsigned long offset)
+{
+	if (small_const_nbits(nbits)) {
+		unsigned long val, ret;
+
+		do {
+			val = *addr | ~GENMASK(nbits - 1, offset);
+			if (val == ~0UL)
+				return nbits;
+			ret = ffz(val);
+		} while (test_and_set_bit(ret, addr));
+
+		return ret;
+	}
+
+	return _find_and_set_next_bit(addr, nbits, offset);
+}
+
+/**
+ * find_and_set_bit_wrap - find and set bit starting at @offset, wrapping around zero
+ * @addr: The first address to base the search on
+ * @nbits: The bitmap size in bits
+ * @offset: The bitnumber to start searching at
+ *
+ * Returns: the bit number for the next clear bit, or first clear bit up to @offset,
+ * while atomically setting it. If no bits are found, returns @nbits.
+ */
+static inline
+unsigned long find_and_set_bit_wrap(volatile unsigned long *addr,
+					unsigned long nbits, unsigned long offset)
+{
+	unsigned long bit = find_and_set_next_bit(addr, nbits, offset);
+
+	if (bit < nbits || offset == 0)
+		return bit;
+
+	bit = find_and_set_bit(addr, offset);
+	return bit < offset ? bit : nbits;
+}
+
+/**
+ * find_and_set_bit_lock - find a zero bit, then set it atomically with lock
+ * @addr: The address to base the search on
+ * @nbits: The bitmap nbits in bits
+ *
+ * This function is designed to operate in concurrent access environment.
+ *
+ * Because of concurrency and volatile nature of underlying bitmap, it's not
+ * guaranteed that the bit found is the 1st bit in the bitmap. It's also not
+ * guaranteed that if @nbits is returned, the bitmap is empty.
+ *
+ * The function does guarantee that if returned value is in range [0 .. @nbits),
+ * the acquired bit belongs to the caller exclusively.
+ *
+ * Returns: found and set bit, or @nbits if no bits found
+ */
+static inline
+unsigned long find_and_set_bit_lock(volatile unsigned long *addr, unsigned long nbits)
+{
+	if (small_const_nbits(nbits)) {
+		unsigned long val, ret;
+
+		do {
+			val = *addr | ~GENMASK(nbits - 1, 0);
+			if (val == ~0UL)
+				return nbits;
+			ret = ffz(val);
+		} while (test_and_set_bit_lock(ret, addr));
+
+		return ret;
+	}
+
+	return _find_and_set_bit_lock(addr, nbits);
+}
+
+/**
+ * find_and_set_next_bit_lock - find a zero bit and set it atomically with lock
+ * @addr: The address to base the search on
+ * @nbits: The bitmap size in bits
+ * @offset: The bitnumber to start searching at
+ *
+ * This function is designed to operate in concurrent access environment.
+ *
+ * Because of concurrency and volatile nature of underlying bitmap, it's not
+ * guaranteed that the bit found is the 1st bit in the range. It's also not
+ * guaranteed that if @nbits is returned, the bitmap is empty.
+ *
+ * The function does guarantee that if returned value is in range [@offset .. @nbits),
+ * the acquired bit belongs to the caller exclusively.
+ *
+ * Returns: found and set bit, or @nbits if no bits found
+ */
+static inline
+unsigned long find_and_set_next_bit_lock(volatile unsigned long *addr,
+					 unsigned long nbits, unsigned long offset)
+{
+	if (small_const_nbits(nbits)) {
+		unsigned long val, ret;
+
+		do {
+			val = *addr | ~GENMASK(nbits - 1, offset);
+			if (val == ~0UL)
+				return nbits;
+			ret = ffz(val);
+		} while (test_and_set_bit_lock(ret, addr));
+
+		return ret;
+	}
+
+	return _find_and_set_next_bit_lock(addr, nbits, offset);
+}
+
+/**
+ * find_and_set_bit_wrap_lock - find zero bit starting at @ofset and set it
+ *				with lock, and wrap around zero if nothing found
+ * @addr: The first address to base the search on
+ * @nbits: The bitmap size in bits
+ * @offset: The bitnumber to start searching at
+ *
+ * Returns: the bit number for the next set bit, or first set bit up to @offset
+ * If no bits are set, returns @nbits.
+ */
+static inline
+unsigned long find_and_set_bit_wrap_lock(volatile unsigned long *addr,
+					unsigned long nbits, unsigned long offset)
+{
+	unsigned long bit = find_and_set_next_bit_lock(addr, nbits, offset);
+
+	if (bit < nbits || offset == 0)
+		return bit;
+
+	bit = find_and_set_bit_lock(addr, offset);
+	return bit < offset ? bit : nbits;
+}
+
+/**
+ * find_and_clear_bit - Find a set bit and clear it atomically
+ * @addr: The address to base the search on
+ * @nbits: The bitmap nbits in bits
+ *
+ * This function is designed to operate in concurrent access environment.
+ *
+ * Because of concurrency and volatile nature of underlying bitmap, it's not
+ * guaranteed that the found bit is the 1st bit in the bitmap. It's also not
+ * guaranteed that if @nbits is returned, the bitmap is empty.
+ *
+ * The function does guarantee that if returned value is in range [0 .. @nbits),
+ * the acquired bit belongs to the caller exclusively.
+ *
+ * Returns: found and cleared bit, or @nbits if no bits found
+ */
+static inline unsigned long find_and_clear_bit(volatile unsigned long *addr, unsigned long nbits)
+{
+	if (small_const_nbits(nbits)) {
+		unsigned long val, ret;
+
+		do {
+			val = *addr & GENMASK(nbits - 1, 0);
+			if (val == 0)
+				return nbits;
+			ret = __ffs(val);
+		} while (!test_and_clear_bit(ret, addr));
+
+		return ret;
+	}
+
+	return _find_and_clear_bit(addr, nbits);
+}
+
+/**
+ * find_and_clear_next_bit - Find a set bit next after @offset, and clear it atomically
+ * @addr: The address to base the search on
+ * @nbits: The bitmap nbits in bits
+ * @offset: bit offset at which to start searching
+ *
+ * This function is designed to operate in concurrent access environment.
+ *
+ * Because of concurrency and volatile nature of underlying bitmap, it's not
+ * guaranteed that the bit found is the 1st bit in the range It's also not
+ * guaranteed that if @nbits is returned, there's no set bits after @offset.
+ *
+ * The function does guarantee that if returned value is in range [@offset .. @nbits),
+ * the acquired bit belongs to the caller exclusively.
+ *
+ * Returns: found and cleared bit, or @nbits if no bits found
+ */
+static inline
+unsigned long find_and_clear_next_bit(volatile unsigned long *addr,
+					unsigned long nbits, unsigned long offset)
+{
+	if (small_const_nbits(nbits)) {
+		unsigned long val, ret;
+
+		do {
+			val = *addr & GENMASK(nbits - 1, offset);
+			if (val == 0)
+				return nbits;
+			ret = __ffs(val);
+		} while (!test_and_clear_bit(ret, addr));
+
+		return ret;
+	}
+
+	return _find_and_clear_next_bit(addr, nbits, offset);
+}
+
 /**
  * find_next_clump8 - find next 8-bit clump with set bits in a memory region
  * @clump: location to store copy of found clump
@@ -577,6 +848,24 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 #define for_each_set_bit_from(bit, addr, size) \
 	for (; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
 
+/* same as for_each_set_bit() but atomically clears each found bit */
+#define for_each_test_and_clear_bit(bit, addr, size) \
+	for ((bit) = 0; \
+	     (bit) = find_and_clear_next_bit((addr), (size), (bit)), (bit) < (size); \
+	     (bit)++)
+
+/* same as for_each_clear_bit() but atomically sets each found bit */
+#define for_each_test_and_set_bit(bit, addr, size) \
+	for ((bit) = 0; \
+	     (bit) = find_and_clear_next_bit((addr), (size), (bit)), (bit) < (size); \
+	     (bit)++)
+
+/* same as for_each_clear_bit_from() but atomically clears each found bit */
+#define for_each_test_and_set_bit_from(bit, addr, size) \
+	for (; \
+	     (bit) = find_and_set_next_bit((addr), (size), (bit)), (bit) < (size); \
+	     (bit)++)
+
 #define for_each_clear_bit(bit, addr, size) \
 	for ((bit) = 0;									\
 	     (bit) = find_next_zero_bit((addr), (size), (bit)), (bit) < (size);		\
diff --git a/lib/find_bit.c b/lib/find_bit.c
index 32f99e9a670e..c9b6b9f96610 100644
--- a/lib/find_bit.c
+++ b/lib/find_bit.c
@@ -116,6 +116,91 @@ unsigned long _find_first_and_bit(const unsigned long *addr1,
 EXPORT_SYMBOL(_find_first_and_bit);
 #endif
 
+unsigned long _find_and_set_bit(volatile unsigned long *addr, unsigned long nbits)
+{
+	unsigned long bit;
+
+	do {
+		bit = FIND_FIRST_BIT(~addr[idx], /* nop */, nbits);
+		if (bit >= nbits)
+			return nbits;
+	} while (test_and_set_bit(bit, addr));
+
+	return bit;
+}
+EXPORT_SYMBOL(_find_and_set_bit);
+
+unsigned long _find_and_set_next_bit(volatile unsigned long *addr,
+				     unsigned long nbits, unsigned long start)
+{
+	unsigned long bit;
+
+	do {
+		bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
+		if (bit >= nbits)
+			return nbits;
+	} while (test_and_set_bit(bit, addr));
+
+	return bit;
+}
+EXPORT_SYMBOL(_find_and_set_next_bit);
+
+unsigned long _find_and_set_bit_lock(volatile unsigned long *addr, unsigned long nbits)
+{
+	unsigned long bit;
+
+	do {
+		bit = FIND_FIRST_BIT(~addr[idx], /* nop */, nbits);
+		if (bit >= nbits)
+			return nbits;
+	} while (test_and_set_bit_lock(bit, addr));
+
+	return bit;
+}
+EXPORT_SYMBOL(_find_and_set_bit_lock);
+
+unsigned long _find_and_set_next_bit_lock(volatile unsigned long *addr,
+					  unsigned long nbits, unsigned long start)
+{
+	unsigned long bit;
+
+	do {
+		bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
+		if (bit >= nbits)
+			return nbits;
+	} while (test_and_set_bit_lock(bit, addr));
+
+	return bit;
+}
+EXPORT_SYMBOL(_find_and_set_next_bit_lock);
+
+unsigned long _find_and_clear_bit(volatile unsigned long *addr, unsigned long nbits)
+{
+	unsigned long bit;
+
+	do {
+		bit = FIND_FIRST_BIT(addr[idx], /* nop */, nbits);
+		if (bit >= nbits)
+			return nbits;
+	} while (!test_and_clear_bit(bit, addr));
+
+	return bit;
+}
+EXPORT_SYMBOL(_find_and_clear_bit);
+
+unsigned long _find_and_clear_next_bit(volatile unsigned long *addr,
+					unsigned long nbits, unsigned long start)
+{
+	do {
+		start =  FIND_NEXT_BIT(addr[idx], /* nop */, nbits, start);
+		if (start >= nbits)
+			return nbits;
+	} while (!test_and_clear_bit(start, addr));
+
+	return start;
+}
+EXPORT_SYMBOL(_find_and_clear_next_bit);
+
 #ifndef find_first_zero_bit
 /*
  * Find the first cleared bit in a memory region.
-- 
2.39.2

