Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7A6B5C87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 14:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYkvn1VmMz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 00:55:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EgpADp9m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=error27@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EgpADp9m;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYktr3n5Hz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Mar 2023 00:54:43 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so5699720wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 05:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678542877;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VNgsWjX3Wuvimz8g5dmkPK1Cy/m4ikAbDoLw6beJQ=;
        b=EgpADp9mPyWPriOHQHt/ftRejPRpNulP0dfOXzeleBhIPgj1NGQIJbytBzJ2k1iF4R
         CyITUZOvJLHKAPxgRdheh7BTJmNg+LH8xo7nE4cpnK/TrtstTxkyuMZEe6QB0uKZbsho
         bha6cNC4l0ab+HfNrdxjVgcV4nNCXjrWHLvd5AgmtK0unzXSSZWpk338fqWEaWfbfDXc
         gS8s4MTSvK5KviuS4DzupSZgdAs7GDKSC97xY/DJNQkr+LExD4sU3rKuRX3/o8kJ1rWj
         n5Cc6BbMqxbQX9xXF/Ai+zkDgJk3y+PUHE9rOyhjFvIaxai7o22SnhvFxKXJxhQbJB/I
         C2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542877;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VNgsWjX3Wuvimz8g5dmkPK1Cy/m4ikAbDoLw6beJQ=;
        b=rg1PstoWsSyx0YMI50VRMErfb+4aSwu8e/n+uUbzDEnzdl/YKKwWRjayNCoDJ7vzV+
         qWQPsZoYK0D0T8XNNCoLerULEIpfLD1dp8DD53Y9w0a39Jcq9ziuy/KjxNHED/sfetOr
         EjsgiuNAjDCYUsCcyS2GuM0ilija8VxGZ/48ylRBFrrc2qaIxeBwj/yWcDWrWMrJb8R9
         SSR9njEYMhK0eXD/LaPOGfWyO3dFsp2lDiy/Ci+q2BtPwGmnai6x/PWbRraJWzVXRhBB
         XLhvGmT51ClZLwXm5JSBzbDmWl2W63aHoWCddfInepfIZuPrVWawYmrZnuPblGttTmen
         eVcA==
X-Gm-Message-State: AO0yUKUItmbIvtR3K2A4OI5lOCl54u3cYsgDCM6njFMFWN5FEBGY4gY4
	5C3+JDdz9mb63rkCcIhLoH8=
X-Google-Smtp-Source: AK7set8Q/kmI9mpEEdXrr7E14surqp2hrZc9WFbOGPYrv2F11V19h1lecKjCq/bjwK7VwWka+od15A==
X-Received: by 2002:a05:600c:4e8c:b0:3eb:4cb5:dfa with SMTP id f12-20020a05600c4e8c00b003eb4cb50dfamr5440417wmq.31.1678542877399;
        Sat, 11 Mar 2023 05:54:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hn4-20020a05600ca38400b003dc1d668866sm2899772wmb.10.2023.03.11.05.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:54:37 -0800 (PST)
Date: Sat, 11 Mar 2023 16:54:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, lkp@intel.com, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/PCI-Introduce-pci_dev_for_each_resource/20230311-011642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230310171416.23356-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230311/202303112149.xD47qKOY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303112149.xD47qKOY-lkp@intel.com/

smatch warnings:
drivers/pnp/quirks.c:248 quirk_system_pci_resources() warn: was && intended here instead of ||?

vim +248 drivers/pnp/quirks.c

0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  229  static void quirk_system_pci_resources(struct pnp_dev *dev)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  230  {
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  231  	struct pci_dev *pdev = NULL;
059b4a086017fb Mika Westerberg 2023-03-10  232  	struct resource *res, *r;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  233  	int i, j;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  234  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  235  	/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  236  	 * Some BIOSes have PNP motherboard devices with resources that
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  237  	 * partially overlap PCI BARs.  The PNP system driver claims these
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  238  	 * motherboard resources, which prevents the normal PCI driver from
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  239  	 * requesting them later.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  240  	 *
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  241  	 * This patch disables the PNP resources that conflict with PCI BARs
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  242  	 * so they won't be claimed by the PNP system driver.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  243  	 */
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  244  	for_each_pci_dev(pdev) {
059b4a086017fb Mika Westerberg 2023-03-10  245  		pci_dev_for_each_resource(pdev, r, i) {
059b4a086017fb Mika Westerberg 2023-03-10  246  			unsigned long type = resource_type(r);
999ed65ad12e37 Rene Herman     2008-07-25  247  
059b4a086017fb Mika Westerberg 2023-03-10 @248  			if (type != IORESOURCE_IO || type != IORESOURCE_MEM ||
                                                                                                  ^^
This || needs to be &&.  This loop will always hit the continue path
without doing anything.

059b4a086017fb Mika Westerberg 2023-03-10  249  			    resource_size(r) == 0)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  250  				continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  251  
059b4a086017fb Mika Westerberg 2023-03-10  252  			if (r->flags & IORESOURCE_UNSET)
f7834c092c4299 Bjorn Helgaas   2015-03-03  253  				continue;
f7834c092c4299 Bjorn Helgaas   2015-03-03  254  
95ab3669f78306 Bjorn Helgaas   2008-04-28  255  			for (j = 0;
999ed65ad12e37 Rene Herman     2008-07-25  256  			     (res = pnp_get_resource(dev, type, j)); j++) {
aee3ad815dd291 Bjorn Helgaas   2008-06-27  257  				if (res->start == 0 && res->end == 0)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  258  					continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  259  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  260  				/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  261  				 * If the PNP region doesn't overlap the PCI
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  262  				 * region at all, there's no problem.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  263  				 */
059b4a086017fb Mika Westerberg 2023-03-10  264  				if (!resource_overlaps(res, r))
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  265  					continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  266  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  267  				/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  268  				 * If the PNP region completely encloses (or is
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  269  				 * at least as large as) the PCI region, that's
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  270  				 * also OK.  For example, this happens when the
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  271  				 * PNP device describes a bridge with PCI
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  272  				 * behind it.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  273  				 */
059b4a086017fb Mika Westerberg 2023-03-10  274  				if (res->start <= r->start && res->end >= r->end)
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  275  					continue;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  276  
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  277  				/*
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  278  				 * Otherwise, the PNP region overlaps *part* of
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  279  				 * the PCI region, and that might prevent a PCI
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  280  				 * driver from requesting its resources.
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  281  				 */
c7dabef8a2c59e Bjorn Helgaas   2009-10-27  282  				dev_warn(&dev->dev,
059b4a086017fb Mika Westerberg 2023-03-10  283  					 "disabling %pR because it overlaps %s BAR %d %pR\n",
059b4a086017fb Mika Westerberg 2023-03-10  284  					 res, pci_name(pdev), i, r);
4b34fe156455d2 Bjorn Helgaas   2008-06-02  285  				res->flags |= IORESOURCE_DISABLED;
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  286  			}
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  287  		}
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  288  	}
0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  289  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

