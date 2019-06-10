Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F933BC6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 21:05:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N2f94RqCzDqGP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 05:05:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vaga.pv.it
 (client-ip=95.128.36.40; helo=mx.kolabnow.com;
 envelope-from=federico.vaga@vaga.pv.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vaga.pv.it
Authentication-Results: lists.ozlabs.org; dkim=pass (4096-bit key;
 secure) header.d=kolabnow.com header.i=@kolabnow.com header.b="Qbjr2lAF"; 
 dkim-atps=neutral
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Mz5P75h1zDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 02:25:45 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 1FF58403E2;
 Mon, 10 Jun 2019 18:25:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received:received:received; s=dkim20160331; t=
 1560183940; x=1561998341; bh=ySLNIX1jiCqldrmER8p/c1YOLUiUU7vfIBo
 k3u7v1yA=; b=Qbjr2lAFN/nwTVFb3YkUWU/8tkK2xRuhjZsLMgdCND9R34aGoNh
 L2rcHMjFoWIBOEyBgi+MymRMgil8vhsvUkvUoupC7SoATMEh/iy6YPVpjA+5H4ji
 Sq9azbND3/SSpkJHQo81xewDfs7u1H8fnDh9kVM4AjM48YEfBXsuVqT4rapzKmul
 1Ei88sIKitJClBwofZmi6InRA8gbKUKcVg7DR+C8Og1oKRbf3v3PTi2BIL/5Ow+m
 fE5WCn3ir1WHhOXjbX9mYQIY6ionQ0oEGjmBF7gnqu8ILBGEfAUdczCqRfLLNKCu
 Mgna0odiTpKA/ttrTXGmAUMaLJYKwuOFR2wMFJm6jNdjUVsq50EPgBNt5hojESRK
 ARVzFlktwS9I7Dg3zxTTNCvNs1SDiPwRgnX2zRa6o2Hrxw0ZA9SD5NGvxwjwYkXn
 RcfHGYEqdsFjfhrPUKzbyHovzfhc/DvM6es5MEDChVM6hbtU3ebGQuYz5ZzCLoU5
 Tf5CE5ptqRaJnjqoewc+2I8Ou8dWd2AozVQYRI4NAjcWVDkkpXeNqNKSa8KUmZ9G
 AbcsC0D7p3FXd28Z6d8F8A8HeKobEE1AM4rGfzQsMzvMT1TA0Dv5erAQVa/NLGEs
 kZJ5ZtcjwU/5TJ6pEvxuxKdns93Yhvd/oWDj/yITosqRFhYy+AwM5lfQ=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-10 required=5
 tests=[BAYES_00=-1.9] autolearn=unavailable autolearn_force=no
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9ph0Cuw_TXP; Mon, 10 Jun 2019 18:25:40 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id 3D67D403AA;
 Mon, 10 Jun 2019 18:25:39 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 6CFED3431;
 Mon, 10 Jun 2019 18:25:38 +0200 (CEST)
From: Federico Vaga <federico.vaga@vaga.pv.it>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v3 14/33] docs: kbuild: convert docs to ReST and rename to
 *.rst
Date: Mon, 10 Jun 2019 18:25:36 +0200
Message-ID: <6349042.qd6NX4z2Zd@harkonnen>
In-Reply-To: <3d40d111d0512d785b6a67573772f532f88d2359.1560045490.git.mchehab+samsung@kernel.org>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <3d40d111d0512d785b6a67573772f532f88d2359.1560045490.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Tue, 11 Jun 2019 05:02:30 +1000
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
Cc: , linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	bridge@lists.linux-foundation.org,
	Palmer Dabbelt <palmer@sifive.com>, alsa-devel@alsa-project.org,
	dri-devel@lists.freedesktop.org, Ofer Levi <oferle@mellanox.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Harry Wei <harryxiyou@gmail.com>, Paul Mackerras <paulus@samba.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
	Vincent Chen <deanbo422@gmail.com>,
	Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
	Jonas Bonn <jonas@southpole.se>,
	Alex Shi <alex.shi@linux.alibaba.com>, linux-c6x-dev@linux-c6x.org,
	linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	netdev@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
	coreteam@netfilter.org, Mark Salter <msalter@redhat.com>,
	Al exey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-snps-arc@lists.infradead.org,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>, devel@driverdev.osuosl.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Johannes Berg <johannes.berg@intel.com>,
	Intel Linux Wireless <linuxwifi@intel.com>,
	Nikolay Aleksandrov <nikolay@cumulusnetworks.com>,
	David Woodhouse <dwmw2@infradead.or>,
	Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	openrisc@lists.librecores.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Greentime Hu <green.hu@gmail.com>, linux-mtd@lists.infradead.org,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Kalle Valo <kvalo@codeaurora.org>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Jon Maloy <jon.maloy@ericsson.com>, Michal Simek <monstr@monstr.eu>,
	Michal Marek <michal.lkml@markovi.net>,
	netfilter-devel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	g@lists.ozlabs.org, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Vineet Gupta <vgupta@synopsys.com>, linux-usb@vger.kernel.org,
	Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
	Roopa Prabhu <roopa@cumulusnetworks.com>,
	Richard Weinberger <richard@nod.at>,
	Ying Xue <ying.xue@windriver.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In data Sunday, June 9, 2019 4:27:04 AM CEST, Mauro Carvalho Chehab ha 
scritto:
> The kbuild documentation clearly shows that the documents
> there are written at different times: some use markdown,
> some use their own peculiar logic to split sections.
> 
> Convert everything to ReST without affecting too much
> the author's style and avoiding adding uneeded markups.
> 
> The conversion is actually:
>   - add blank lines and identation in order to identify paragraphs;
>   - fix tables markups;
>   - add some lists markups;
>   - mark literal blocks;
>   - adjust title markups.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/admin-guide/README.rst          |   2 +-
>  ...eaders_install.txt => headers_install.rst} |   5 +-
>  Documentation/kbuild/index.rst                |  27 +
>  Documentation/kbuild/issues.rst               |  11 +
>  .../kbuild/{kbuild.txt => kbuild.rst}         | 119 ++--
>  ...nfig-language.txt => kconfig-language.rst} | 232 ++++----
>  ...anguage.txt => kconfig-macro-language.rst} |  37 +-
>  .../kbuild/{kconfig.txt => kconfig.rst}       | 136 +++--
>  .../kbuild/{makefiles.txt => makefiles.rst}   | 530 +++++++++++-------
>  .../kbuild/{modules.txt => modules.rst}       | 168 +++---
>  Documentation/kernel-hacking/hacking.rst      |   4 +-
>  Documentation/process/coding-style.rst        |   2 +-
>  Documentation/process/submit-checklist.rst    |   2 +-
>  .../it_IT/kernel-hacking/hacking.rst          |   4 +-
>  .../it_IT/process/coding-style.rst            |   2 +-
>  .../it_IT/process/submit-checklist.rst        |   2 +-

Limited to translations/it_IT

Acked-by: Federico Vaga <federico.vaga@vaga.pv.it>

>  .../zh_CN/process/coding-style.rst            |   2 +-
>  .../zh_CN/process/submit-checklist.rst        |   2 +-
>  Kconfig                                       |   2 +-
>  arch/arc/plat-eznps/Kconfig                   |   2 +-
>  arch/c6x/Kconfig                              |   2 +-
>  arch/microblaze/Kconfig.debug                 |   2 +-
>  arch/microblaze/Kconfig.platform              |   2 +-
>  arch/nds32/Kconfig                            |   2 +-
>  arch/openrisc/Kconfig                         |   2 +-
>  arch/powerpc/sysdev/Kconfig                   |   2 +-
>  arch/riscv/Kconfig                            |   2 +-
>  drivers/auxdisplay/Kconfig                    |   2 +-
>  drivers/firmware/Kconfig                      |   2 +-
>  drivers/mtd/devices/Kconfig                   |   2 +-
>  drivers/net/ethernet/smsc/Kconfig             |   6 +-
>  drivers/net/wireless/intel/iwlegacy/Kconfig   |   4 +-
>  drivers/net/wireless/intel/iwlwifi/Kconfig    |   2 +-
>  drivers/parport/Kconfig                       |   2 +-
>  drivers/scsi/Kconfig                          |   4 +-
>  drivers/staging/sm750fb/Kconfig               |   2 +-
>  drivers/usb/misc/Kconfig                      |   4 +-
>  drivers/video/fbdev/Kconfig                   |  14 +-
>  net/bridge/netfilter/Kconfig                  |   2 +-
>  net/ipv4/netfilter/Kconfig                    |   2 +-
>  net/ipv6/netfilter/Kconfig                    |   2 +-
>  net/netfilter/Kconfig                         |  16 +-
>  net/tipc/Kconfig                              |   2 +-
>  scripts/Kbuild.include                        |   4 +-
>  scripts/Makefile.host                         |   2 +-
>  scripts/kconfig/symbol.c                      |   2 +-
>  .../tests/err_recursive_dep/expected_stderr   |  14 +-
>  sound/oss/dmasound/Kconfig                    |   6 +-
>  48 files changed, 840 insertions(+), 561 deletions(-)
>  rename Documentation/kbuild/{headers_install.txt => headers_install.rst}
> (96%) create mode 100644 Documentation/kbuild/index.rst
>  create mode 100644 Documentation/kbuild/issues.rst
>  rename Documentation/kbuild/{kbuild.txt => kbuild.rst} (72%)
>  rename Documentation/kbuild/{kconfig-language.txt => kconfig-language.rst}
> (85%) rename Documentation/kbuild/{kconfig-macro-language.txt =>
> kconfig-macro-language.rst} (94%) rename Documentation/kbuild/{kconfig.txt
> => kconfig.rst} (80%)
>  rename Documentation/kbuild/{makefiles.txt => makefiles.rst} (83%)
>  rename Documentation/kbuild/{modules.txt => modules.rst} (84%)





