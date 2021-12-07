Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 125F346BFE1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 16:50:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7lBW0TQ4z3c9b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 02:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout2.mo529.mail-out.ovh.net
 (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7l9z10zLz2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 02:50:12 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 876D2D06810E;
 Tue,  7 Dec 2021 16:50:06 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 16:50:04 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0016d463d06-8f28-4116-8296-36026f977615,
 D5B34436B48CBBE29FDE786D5871FA4E32D79878) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.172.254
Message-ID: <27f22e0e-8f84-a6d7-704b-d9eddc642d74@kaod.org>
Date: Tue, 7 Dec 2021 16:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch V2 01/23] powerpc/4xx: Remove MSI support which never
 worked
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner
 <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20211206210147.872865823@linutronix.de>
 <20211206210223.872249537@linutronix.de>
 <8d1e9d2b-fbe9-2e15-6df6-03028902791a@kaod.org>
 <87ilw0odel.fsf@mpe.ellerman.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87ilw0odel.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3ba07c30-c0fb-4b34-adb9-c7c234a94237
X-Ovh-Tracer-Id: 9416182396562148133
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehgdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohephhgtrgeslhhinhhugidrihgsmhdrtghomh
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
Cc: linux-hyperv@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
 Kevin Tian <kevin.tian@intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/7/21 12:36, Michael Ellerman wrote:
> Cédric Le Goater <clg@kaod.org> writes:
>> Hello Thomas,
>>
>> On 12/6/21 23:27, Thomas Gleixner wrote:
>>> This code is broken since day one. ppc4xx_setup_msi_irqs() has the
>>> following gems:
>>>
>>>    1) The handling of the result of msi_bitmap_alloc_hwirqs() is completely
>>>       broken:
>>>       
>>>       When the result is greater than or equal 0 (bitmap allocation
>>>       successful) then the loop terminates and the function returns 0
>>>       (success) despite not having installed an interrupt.
>>>
>>>       When the result is less than 0 (bitmap allocation fails), it prints an
>>>       error message and continues to "work" with that error code which would
>>>       eventually end up in the MSI message data.
>>>
>>>    2) On every invocation the file global pp4xx_msi::msi_virqs bitmap is
>>>       allocated thereby leaking the previous one.
>>>
>>> IOW, this has never worked and for more than 10 years nobody cared. Remove
>>> the gunk.
>>>
>>> Fixes: 3fb7933850fa ("powerpc/4xx: Adding PCIe MSI support")
>>
>> Shouldn't we remove all of it ? including the updates in the device trees
>> and the Kconfig changes under :
>>
>> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
>> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
>> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
>> arch/powerpc/platforms/44x/Kconfig:	select PPC4xx_MSI
>> arch/powerpc/platforms/40x/Kconfig:	select PPC4xx_MSI
> 
> This patch should drop those selects I guess. Can you send an
> incremental diff for Thomas to squash in?

Sure.

> Removing all the tendrils in various device tree files will probably
> require some archaeology, and it should be perfectly safe to leave those
> in the tree with the driver gone. So I think we can do that as a
> subsequent patch, rather than in this series.

Here are the changes. Compiled tested with ppc40x and ppc44x defconfigs.

Thanks,

C.

diff --git a/arch/powerpc/boot/dts/bluestone.dts b/arch/powerpc/boot/dts/bluestone.dts
index aa1ae94cd776..6971595319c1 100644
--- a/arch/powerpc/boot/dts/bluestone.dts
+++ b/arch/powerpc/boot/dts/bluestone.dts
@@ -366,30 +366,5 @@ PCIE0: pcie@d00000000 {
  				0x0 0x0 0x0 0x3 &UIC3 0xe 0x4 /* swizzled int C */
  				0x0 0x0 0x0 0x4 &UIC3 0xf 0x4 /* swizzled int D */>;
  		};
-
-		MSI: ppc4xx-msi@C10000000 {
-			compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-			reg = < 0xC 0x10000000 0x100
-				0xC 0x10000000 0x100>;
-			sdr-base = <0x36C>;
-			msi-data = <0x00004440>;
-			msi-mask = <0x0000ffe0>;
-			interrupts =<0 1 2 3 4 5 6 7>;
-			interrupt-parent = <&MSI>;
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			msi-available-ranges = <0x0 0x100>;
-			interrupt-map = <
-				0 &UIC3 0x18 1
-				1 &UIC3 0x19 1
-				2 &UIC3 0x1A 1
-				3 &UIC3 0x1B 1
-				4 &UIC3 0x1C 1
-				5 &UIC3 0x1D 1
-				6 &UIC3 0x1E 1
-				7 &UIC3 0x1F 1
-			>;
-		};
  	};
  };
diff --git a/arch/powerpc/boot/dts/canyonlands.dts b/arch/powerpc/boot/dts/canyonlands.dts
index c5fbb08e0a6e..5db1bff6b23d 100644
--- a/arch/powerpc/boot/dts/canyonlands.dts
+++ b/arch/powerpc/boot/dts/canyonlands.dts
@@ -544,23 +544,5 @@ PCIE1: pcie@d20000000 {
  				0x0 0x0 0x0 0x3 &UIC3 0x12 0x4 /* swizzled int C */
  				0x0 0x0 0x0 0x4 &UIC3 0x13 0x4 /* swizzled int D */>;
  		};
-
-		MSI: ppc4xx-msi@C10000000 {
-			compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-			reg = < 0xC 0x10000000 0x100>;
-			sdr-base = <0x36C>;
-			msi-data = <0x00000000>;
-			msi-mask = <0x44440000>;
-			interrupt-count = <3>;
-			interrupts = <0 1 2 3>;
-			interrupt-parent = <&UIC3>;
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0 &UIC3 0x18 1
-					1 &UIC3 0x19 1
-					2 &UIC3 0x1A 1
-					3 &UIC3 0x1B 1>;
-		};
  	};
  };
diff --git a/arch/powerpc/boot/dts/katmai.dts b/arch/powerpc/boot/dts/katmai.dts
index a8f353229fb7..4262b2bbd6de 100644
--- a/arch/powerpc/boot/dts/katmai.dts
+++ b/arch/powerpc/boot/dts/katmai.dts
@@ -442,24 +442,6 @@ PCIE2: pcie@d40000000 {
  				0x0 0x0 0x0 0x4 &UIC3 0xb 0x4 /* swizzled int D */>;
  		};
  
-		MSI: ppc4xx-msi@400300000 {
-				compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-				reg = < 0x4 0x00300000 0x100>;
-				sdr-base = <0x3B0>;
-				msi-data = <0x00000000>;
-				msi-mask = <0x44440000>;
-				interrupt-count = <3>;
-				interrupts =<0 1 2 3>;
-				interrupt-parent = <&UIC0>;
-				#interrupt-cells = <1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				interrupt-map = <0 &UIC0 0xC 1
-					1 &UIC0 0x0D 1
-					2 &UIC0 0x0E 1
-					3 &UIC0 0x0F 1>;
-		};
-
  		I2O: i2o@400100000 {
  			compatible = "ibm,i2o-440spe";
  			reg = <0x00000004 0x00100000 0x100>;
diff --git a/arch/powerpc/boot/dts/kilauea.dts b/arch/powerpc/boot/dts/kilauea.dts
index a709fb47a180..c07a7525a72c 100644
--- a/arch/powerpc/boot/dts/kilauea.dts
+++ b/arch/powerpc/boot/dts/kilauea.dts
@@ -403,33 +403,5 @@ PCIE1: pcie@c0000000 {
  				0x0 0x0 0x0 0x3 &UIC2 0xd 0x4 /* swizzled int C */
  				0x0 0x0 0x0 0x4 &UIC2 0xe 0x4 /* swizzled int D */>;
  		};
-
-		MSI: ppc4xx-msi@C10000000 {
-			compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-			reg = <0xEF620000 0x100>;
-			sdr-base = <0x4B0>;
-			msi-data = <0x00000000>;
-			msi-mask = <0x44440000>;
-			interrupt-count = <12>;
-			interrupts = <0 1 2 3 4 5 6 7 8 9 0xA 0xB 0xC 0xD>;
-			interrupt-parent = <&UIC2>;
-			#interrupt-cells = <1>;
-			#address-cells = <0>;
-			#size-cells = <0>;
-			interrupt-map = <0 &UIC2 0x10 1
-					1 &UIC2 0x11 1
-					2 &UIC2 0x12 1
-					2 &UIC2 0x13 1
-					2 &UIC2 0x14 1
-					2 &UIC2 0x15 1
-					2 &UIC2 0x16 1
-					2 &UIC2 0x17 1
-					2 &UIC2 0x18 1
-					2 &UIC2 0x19 1
-					2 &UIC2 0x1A 1
-					2 &UIC2 0x1B 1
-					2 &UIC2 0x1C 1
-					3 &UIC2 0x1D 1>;
-		};
  	};
  };
diff --git a/arch/powerpc/boot/dts/redwood.dts b/arch/powerpc/boot/dts/redwood.dts
index f38035a1f4a1..3c849e23e5f3 100644
--- a/arch/powerpc/boot/dts/redwood.dts
+++ b/arch/powerpc/boot/dts/redwood.dts
@@ -358,25 +358,6 @@ PCIE2: pcie@d40000000 {
  				0x0 0x0 0x0 0x4 &UIC3 0xb 0x4 /* swizzled int D */>;
  		};
  
-		MSI: ppc4xx-msi@400300000 {
-				compatible = "amcc,ppc4xx-msi", "ppc4xx-msi";
-				reg = < 0x4 0x00300000 0x100
-					0x4 0x00300000 0x100>;
-				sdr-base = <0x3B0>;
-				msi-data = <0x00000000>;
-				msi-mask = <0x44440000>;
-				interrupt-count = <3>;
-				interrupts =<0 1 2 3>;
-				interrupt-parent = <&UIC0>;
-				#interrupt-cells = <1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				interrupt-map = <0 &UIC0 0xC 1
-					1 &UIC0 0x0D 1
-					2 &UIC0 0x0E 1
-					3 &UIC0 0x0F 1>;
-		};
-
  	};
  
  
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index e3e5217c9822..614ea6dc994c 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -23,7 +23,6 @@ config KILAUEA
  	select PPC4xx_PCI_EXPRESS
  	select FORCE_PCI
  	select PCI_MSI
-	select PPC4xx_MSI
  	help
  	  This option enables support for the AMCC PPC405EX evaluation board.
  
diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 83975ef50975..25b80cd558f8 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -23,7 +23,6 @@ config BLUESTONE
  	select APM821xx
  	select FORCE_PCI
  	select PCI_MSI
-	select PPC4xx_MSI
  	select PPC4xx_PCI_EXPRESS
  	select IBM_EMAC_RGMII if IBM_EMAC
  	help
@@ -73,7 +72,6 @@ config KATMAI
  	select FORCE_PCI
  	select PPC4xx_PCI_EXPRESS
  	select PCI_MSI
-	select PPC4xx_MSI
  	help
  	  This option enables support for the AMCC PPC440SPe evaluation board.
  
@@ -115,7 +113,6 @@ config CANYONLANDS
  	select FORCE_PCI
  	select PPC4xx_PCI_EXPRESS
  	select PCI_MSI
-	select PPC4xx_MSI
  	select IBM_EMAC_RGMII if IBM_EMAC
  	select IBM_EMAC_ZMII if IBM_EMAC
  	help
@@ -141,7 +138,6 @@ config REDWOOD
  	select FORCE_PCI
  	select PPC4xx_PCI_EXPRESS
  	select PCI_MSI
-	select PPC4xx_MSI
  	help
  	  This option enables support for the AMCC PPC460SX Redwood board.
  
-- 
2.31.1


