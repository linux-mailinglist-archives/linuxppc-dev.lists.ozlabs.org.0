Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50781E4377
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 08:15:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zv3k4FLKzDqgW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 17:15:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=monstr.eu
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=monstr@monstr.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.b="QrKWgESw"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ztyk13fmzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 17:10:51 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id w9so689221wmm.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 23:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id;
 bh=UZtQcpZNm2bgRElTtB0/YYRtxpmigD0UWuciJCpp5gM=;
 b=QrKWgESwGfrtCnkB4ANF4RDTIvZX+3mgrn+F048ehqIGeg2PIMapuhi5B29YdIPJRF
 OuF/1XgB1E3hujF7fmLSGOWHCpq+9DlFVEduBO8ipDdnjmiangiskHjwO3FsA7j8x1KD
 1Smuo6qnW1seJDFFROI5kLkQKHJzW7j8nL7QRsx6D6T92OoNZE6hSbJWqfQ2kzquPzUV
 EGGwKGRq2Dt/b39DcGka7dZFK17Wt7MIOIDReJEBLetmCZXSMWSBNVp4MthobvqT9E3G
 LimR87SPwJ5FuFVOpPQc3/2WoUZLiJcnk52cJ7R4bO2cA7rCH/FuOM9im/yZQR0mR3/u
 6apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=UZtQcpZNm2bgRElTtB0/YYRtxpmigD0UWuciJCpp5gM=;
 b=cuj+Cv89k8TsCy5lHVOCdTP8/lQibuhO51PPtjzmyPbjm/KNJsxKDv1Op49xRgVWT+
 cGmbaAmCirbvd4klAGKfnyVPH3U7c3Ge7hD/X5+9MZuG/ZLVdyWiPK8MeoHDWLD3cIcp
 gK7W5Gs4p8pMkKuW4RmEhe26rQ0tf286VHLJPBRXLW6kQuvd3//P+EihSM4i1ryMMzAB
 W8yDnQrixniQvLKGoom+1utrc2KkyVBK2knhyxwRal31eZDunye4Csgm32LwGBVc/B1h
 fK/FtfjxrRyygszUdOcsxGsIl3uN/qcD56aMnrI/TrkuXIhNvOmkSBOetdeFXM0zOjjl
 wVvQ==
X-Gm-Message-State: APjAAAWXlEeXjlNNXp2rdMEAu4Dvq4JeACom6yaYcpepxq+stZcpM9Qy
 NFZy0xtx9oAiEzDVlgQgYw/q5A==
X-Google-Smtp-Source: APXvYqwEgYO6Ro5u2lCKSVB90BazD7V/pF/lyQv5RjmcJQ3shOXOE39URbi4sRXKy/2ygEnJau+JXA==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr1846926wml.46.1571983844471;
 Thu, 24 Oct 2019 23:10:44 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id k24sm6458006wmi.1.2019.10.24.23.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 23:10:43 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, palmer@sifive.com, hch@infradead.org, longman@redhat.com,
 helgaas@kernel.org
Subject: [PATCH v2 0/2] Enabling MSI for Microblaze
Date: Fri, 25 Oct 2019 08:10:36 +0200
Message-Id: <cover.1571983829.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Eric Biggers <ebiggers@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@kernel.org>,
 Firoz Khan <firoz.khan@linaro.org>, Wesley Terpstra <wesley@sifive.com>,
 James Hogan <jhogan@kernel.org>, linux-snps-arc@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

these two patches come from discussion with Christoph, Bjorn, Palmer and
Waiman. The first patch was suggestion by Christoph here
https://lore.kernel.org/linux-riscv/20191008154604.GA7903@infradead.org/
The second part was discussed
https://lore.kernel.org/linux-pci/mhng-5d9bcb53-225e-441f-86cc-b335624b3e7c@palmer-si-x1e/
and
https://lore.kernel.org/linux-pci/20191017181937.7004-1-palmer@sifive.com/

Thanks,
Michal

Changes in v2:
- Fix typo in commit message s/expect/except/ - Reported-by: Masahiro

Michal Simek (1):
  asm-generic: Make msi.h a mandatory include/asm header

Palmer Dabbelt (1):
  pci: Default to PCI_MSI_IRQ_DOMAIN

 arch/arc/include/asm/Kbuild     | 1 -
 arch/arm/include/asm/Kbuild     | 1 -
 arch/arm64/include/asm/Kbuild   | 1 -
 arch/mips/include/asm/Kbuild    | 1 -
 arch/powerpc/include/asm/Kbuild | 1 -
 arch/riscv/include/asm/Kbuild   | 1 -
 arch/sparc/include/asm/Kbuild   | 1 -
 drivers/pci/Kconfig             | 2 +-
 include/asm-generic/Kbuild      | 1 +
 9 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.17.1

