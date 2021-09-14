Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7F40B0C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 16:34:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H85Tk4Gz8z3cVT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 00:34:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jfnoiHVx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jfnoiHVx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H85RV0btSz3bsp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 00:32:54 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A1DD6113E;
 Tue, 14 Sep 2021 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631629970;
 bh=bx3eNw9JOL5+zZqI1OEY2aJtfPAlh9PS4CL694WVv58=;
 h=From:To:Cc:Subject:Date:From;
 b=jfnoiHVxtBYsUSxOV6zLXSMXfjiZsRkW/G+dJeExP4I1rpLyg1xu+brEzSXipnnUQ
 G63mVRCVPptiA1YRc1OkfLV3Sq+kOQf1j8O1LmnDKAQLWu9BoXE82mGjpZzuZXqpNo
 Wufz0EQJT7oanxewUmhkJeBN59hgNK1m9UGiUm6gugfzRhzgV7nIA6lf+ycHcD0GOf
 gFquyg6rQqabKsni1qxB8MHSIg4kMXd05oQeZ2HyW220DCSiytcSgVHZmrK2hlX7fX
 Rjwll/xj1x/9c1ZtAiYZKjbTgnyHlT47ggTuS4P9ao26PM9XWCkfGgpEBkbRlrsaj5
 rlIOKnnXeiP6A==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mQ9UN-000KkD-8d; Tue, 14 Sep 2021 16:32:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v2 00/29] Change wildcards on ABI files
Date: Tue, 14 Sep 2021 16:32:15 +0200
Message-Id: <cover.1631629496.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Colin Cross <ccross@android.com>,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ABI files are meant to be parsed via a script (scripts/get_abi.pl).

A new improvement on it will allow it to help to detect if an ABI description
is missing, or if the What: field won't match the actual location of the symbol.

In order for get_abi.pl to convert What: into regex, changes are needed on
existing ABI files, as the conversion should not be ambiguous.

One alternative would be to convert everything into regexes, but this
would generate a huge amount of patches/changes. So, instead, let's
touch only the ABI files that aren't following the de-facto wildcard 
standards already found on most of the ABI files, e. g.:

	/.../
	*
	<foo>
	(option1|option2)
	X
	Y
	Z
	[0-9] (and variants)

A couple of the patches here came from v1, but most of the patches were
written to address things like rcN, where N is a wildcard.

We can't teach get_abi.pl to use an uppercase "N" letter to be a wildcard,
as the USB ABI already uses "N" inside some of their symbols, like 
bNumEndpoints.

Mauro Carvalho Chehab (29):
  ABI: sysfs-bus-usb: better document variable argument
  ABI: sysfs-tty: better document module name parameter
  ABI: sysfs-kernel-slab: use a wildcard for the cache name
  ABI: security: fix location for evm and ima_policy
  ABI: sysfs-class-tpm: use wildcards for pcr-* nodes
  ABI: sysfs-bus-rapidio: use wildcards on What definitions
  ABI: sysfs-class-cxl: place "not in a guest" at description
  ABI: sysfs-class-devfreq-event: use the right wildcards on What
  ABI: sysfs-class-mic: use the right wildcards on What definitions
  ABI: pstore: Fix What field
  ABI: sysfs-class-typec: fix a bad What field
  ABI: sysfs-ata: use a proper wildcard for ata_*
  ABI: sysfs-class-infiniband: use wildcards on What definitions
  ABI: sysfs-bus-pci: use wildcards on What definitions
  ABI: sysfs-bus-soundwire-master: use wildcards on What definitions
  ABI: sysfs-bus-soundwire-slave: use wildcards on What definitions
  ABI: sysfs-class-gnss: use wildcards on What definitions
  ABI: sysfs-class-mei: use wildcards on What definitions
  ABI: sysfs-class-mux: use wildcards on What definitions
  ABI: sysfs-class-pwm: use wildcards on What definitions
  ABI: sysfs-class-rc: use wildcards on What definitions
  ABI: sysfs-class-rc-nuvoton: use wildcards on What definitions
  ABI: sysfs-class-uwb_rc: use wildcards on What definitions
  ABI: sysfs-class-uwb_rc-wusbhc: use wildcards on What definitions
  ABI: sysfs-devices-platform-dock: use wildcards on What definitions
  ABI: sysfs-devices-system-cpu: use wildcards on What definitions
  ABI: sysfs-firmware-efi-esrt: use wildcards on What definitions
  ABI: sysfs-platform-sst-atom: use wildcards on What definitions
  ABI: sysfs-ptp: use wildcards on What definitions

 .../ABI/stable/sysfs-class-infiniband         | 64 ++++++-------
 Documentation/ABI/stable/sysfs-class-tpm      |  2 +-
 Documentation/ABI/testing/evm                 |  4 +-
 Documentation/ABI/testing/ima_policy          |  2 +-
 Documentation/ABI/testing/pstore              |  3 +-
 Documentation/ABI/testing/sysfs-ata           |  2 +-
 Documentation/ABI/testing/sysfs-bus-pci       |  2 +-
 Documentation/ABI/testing/sysfs-bus-rapidio   | 32 +++----
 .../ABI/testing/sysfs-bus-soundwire-master    |  2 +-
 .../ABI/testing/sysfs-bus-soundwire-slave     |  2 +-
 Documentation/ABI/testing/sysfs-bus-usb       | 16 ++--
 Documentation/ABI/testing/sysfs-class-cxl     | 15 ++-
 .../ABI/testing/sysfs-class-devfreq-event     | 12 +--
 Documentation/ABI/testing/sysfs-class-gnss    |  2 +-
 Documentation/ABI/testing/sysfs-class-mei     | 18 ++--
 Documentation/ABI/testing/sysfs-class-mic     | 24 ++---
 Documentation/ABI/testing/sysfs-class-mux     |  2 +-
 Documentation/ABI/testing/sysfs-class-pwm     | 20 ++--
 Documentation/ABI/testing/sysfs-class-rc      | 14 +--
 .../ABI/testing/sysfs-class-rc-nuvoton        |  2 +-
 Documentation/ABI/testing/sysfs-class-typec   |  2 +-
 Documentation/ABI/testing/sysfs-class-uwb_rc  | 26 ++---
 .../ABI/testing/sysfs-class-uwb_rc-wusbhc     | 10 +-
 .../ABI/testing/sysfs-devices-platform-dock   | 10 +-
 .../ABI/testing/sysfs-devices-system-cpu      | 16 ++--
 .../ABI/testing/sysfs-firmware-efi-esrt       | 16 ++--
 Documentation/ABI/testing/sysfs-kernel-slab   | 94 +++++++++----------
 .../ABI/testing/sysfs-platform-sst-atom       |  2 +-
 Documentation/ABI/testing/sysfs-ptp           | 30 +++---
 Documentation/ABI/testing/sysfs-tty           | 32 +++----
 30 files changed, 242 insertions(+), 236 deletions(-)

-- 
2.31.1


