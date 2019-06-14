Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D86A451C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 04:06:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q3rW2ydTzDr4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 12:06:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org; envelope-from=mchehab@bombadil.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q3p04zLpzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 12:04:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aQUK413dBnPXJRbLUE6/RHV++edzrn3sivF8fzDWpGc=; b=hkvPTUNcFjmIKqVi/42DI9hcc
 djs1/CZZ1gEi9/pkYp7JBfy+mzE4TN3vkpNxJQh+cxpMRjoZUQcYKThK+Lbc9vaeo/sl8COrkoihQ
 2Nkm9p9a41yPkSk0oiQ+uqa9oaJuLpxhPzO87IqfhV1REBX6QdyTJk7Iexd5hgkPKXUb5IA07VKQe
 XftuKi6beE3iXFUKmgQ526h4XS+dEAK09FLVKDxMSBZDMm71B91V+TcVb8eWcF/Dwv1toe1WcA/6A
 XywndEaNPy/piJ98UTvHIdgHMyT3QFWskJPRUdKWRYklnTH2RNGvnLIL8zv28a+39Mv9Q16ozoVaQ
 AKLPWGR4A==;
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251]
 helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbbZv-0000EJ-7a; Fri, 14 Jun 2019 02:04:31 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hbbZn-0002nV-M0; Thu, 13 Jun 2019 23:04:23 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 00/14] Add support to generate ABI documentation at admin-guide
Date: Thu, 13 Jun 2019 23:04:06 -0300
Message-Id: <cover.1560477540.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Lars-Peter Clausen <lars@metafoo.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, linux-pm@vger.kernel.org,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 Andreas Klinger <ak@it-klinger.de>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Stefan Achatz <erazor_de@users.sourceforge.net>,
 Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg,

As promised, I'm resending the patch series with adds the Kernel ABI to
Documentation/admin-guide.

Those patches are basically the version 3 patchset I sent back in 2017,
rebased on the top of linux-next (next-20190613), and with some fixes
in order for it to work.

- The 4 initial patches to fix some ABI descriptions that are violating 
  the syntax described at Documentation/ABI/README;

- The next 6 patches are the ones originally written in 2017 with a
  script with parses the ABI files;

- The 11th patch is a new one: it relaxes a little bit the parser in 
  order to parse file headers that contains colons on it;

- The 12th patch adds the new script to the documentation build
  system, together with a new python Sphinx extension with calls it;

- The 13th patch fixes the python script when running with newer
  Sphinx versions (1.7 and upper);

- The final patch fixes an UTF-8 trouble. I noticed it only with Sphinx
  1.4, but it could affect other versions too. So, I ended by changing
  the UTF-8 encoding logit to work version-independent, just like
  what happens with kerneldoc.py extension.

Mauro Carvalho Chehab (14):
  ABI: fix some syntax issues at the ABI database
  ABI: sysfs-driver-hid: the "What" field doesn't parse fine
  ABI: sysfs-class-uwb_rc: remove a duplicated incomplete entry
  ABI: better identificate tables
  scripts: add an script to parse the ABI files
  scripts/get_abi.pl: parse files with text at beginning
  scripts/get_abi.pl: avoid use literal blocks when not needed
  scripts/get_abi.pl: split label naming from xref logic
  scripts/get_abi.pl: add support for searching for ABI symbols
  scripts/get_abi.pl: represent what in tables
  scripts/get_abi.pl: fix parse issues with some files
  doc-rst: add ABI documentation to the admin-guide book
  sphinx/kernel_abi.py: make it compatible with Sphinx 1.7+
  docs: sphinx/kernel_abi.py: fix UTF-8 support

 .../ABI/obsolete/sysfs-driver-hid-roccat-pyra |   2 +-
 Documentation/ABI/testing/pstore              |   2 +-
 .../sysfs-bus-event_source-devices-format     |   2 +-
 .../ABI/testing/sysfs-bus-i2c-devices-hm6352  |   6 +-
 .../ABI/testing/sysfs-bus-iio-distance-srf08  |   4 +-
 .../testing/sysfs-bus-iio-proximity-as3935    |   4 +-
 .../ABI/testing/sysfs-bus-pci-devices-cciss   |  22 +-
 .../testing/sysfs-bus-usb-devices-usbsevseg   |  12 +-
 .../sysfs-class-backlight-driver-lm3533       |   6 +-
 Documentation/ABI/testing/sysfs-class-cxl     |   6 +-
 Documentation/ABI/testing/sysfs-class-devfreq |   2 +-
 .../ABI/testing/sysfs-class-led-driver-lm3533 |   8 +-
 .../ABI/testing/sysfs-class-leds-gt683r       |   4 +-
 .../ABI/testing/sysfs-class-powercap          |   2 +-
 Documentation/ABI/testing/sysfs-class-uwb_rc  |   6 -
 Documentation/ABI/testing/sysfs-driver-hid    |  12 +-
 .../ABI/testing/sysfs-driver-hid-roccat-kone  |   2 +-
 Documentation/ABI/testing/sysfs-kernel-fscaps |   2 +-
 .../ABI/testing/sysfs-kernel-vmcoreinfo       |   2 +-
 Documentation/admin-guide/abi-obsolete.rst    |  10 +
 Documentation/admin-guide/abi-removed.rst     |   4 +
 Documentation/admin-guide/abi-stable.rst      |  13 +
 Documentation/admin-guide/abi-testing.rst     |  19 +
 Documentation/admin-guide/abi.rst             |  11 +
 Documentation/admin-guide/index.rst           |   1 +
 Documentation/conf.py                         |   2 +-
 Documentation/sphinx/kernel_abi.py            | 172 +++++++
 scripts/get_abi.pl                            | 450 ++++++++++++++++++
 28 files changed, 731 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/admin-guide/abi-obsolete.rst
 create mode 100644 Documentation/admin-guide/abi-removed.rst
 create mode 100644 Documentation/admin-guide/abi-stable.rst
 create mode 100644 Documentation/admin-guide/abi-testing.rst
 create mode 100644 Documentation/admin-guide/abi.rst
 create mode 100644 Documentation/sphinx/kernel_abi.py
 create mode 100755 scripts/get_abi.pl

-- 
2.21.0


