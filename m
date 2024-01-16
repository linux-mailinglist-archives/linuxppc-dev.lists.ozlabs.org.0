Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF482E931
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 06:25:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDcst1ypMz3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 16:25:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fujitsu.com (client-ip=207.54.90.137; helo=esa11.hc1455-7.c3s2.iphmx.com; envelope-from=lizhijian@fujitsu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 16 Jan 2024 15:13:05 AEDT
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDbGB01Y8z3bdm;
	Tue, 16 Jan 2024 15:13:05 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="125640431"
X-IronPort-AV: E=Sophos;i="6.04,198,1695654000"; 
   d="scan'208";a="125640431"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 13:11:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC3E7CA246;
	Tue, 16 Jan 2024 13:11:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8501D94BA;
	Tue, 16 Jan 2024 13:11:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E4B102C6655;
	Tue, 16 Jan 2024 13:11:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D30711A0070;
	Tue, 16 Jan 2024 12:11:43 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/42] Fix coccicheck warnings
Date: Tue, 16 Jan 2024 12:10:47 +0800
Message-Id: <20240116041129.3937800-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.004
X-TMASE-Result: 10--5.338000-10.000000
X-TMASE-MatchedRID: APZBv0eB5fJy4CNxYSkcLoL5ja7E+OhyuoYFb0nRiqO/XSsQNWtCeIAj
	6kt+TewHC3vXNyJNBUS/2a/w1wS2snh1rPkUeh+7A9lly13c/gEMZvHcAgmELNM4cBkOddRug4T
	d/DBNkVPBV4b4vif9P70QU2u8uQPlKz8U6m7mv8Csxn4GpC3Y2mDbldQedDmvdr2Udl3Og/5evz
	2JvPJmxmu4/NMq7ELJiJZIlifpj2n9iEfE2OtmsHZwubmkurW/Urr7Qc5WhKixViPWo8HTYkdes
	bjoBZ/kx3iFO+XIjdvtpuHnoJaRs49oUcx9VMLggxsfzkNRlfLdB/CxWTRRu25FeHtsUoHuFXh8
	AHLXJNBIMK2NL4dx8OCrxKVMkOf0hhdqTS9iikoJK2MK45H+GA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Mailman-Approved-At: Tue, 16 Jan 2024 16:24:27 +1100
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
Cc: Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Christian Gromm <christian.gromm@microchip.com>, Sathya Prakash <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, linux-iio@vger.kernel.org, Chandrakanth patil <chandrakanth.patil@broadcom.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Li Zhijian <lizhijian@fujitsu.com>, Thomas Gleixner <tglx@linutronix.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, Stefan Achatz <erazor_de@users.sourceforge.net>, megaraidlinux.pdl@broadcom.com, linux-perf-users@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com, Jiri Olsa <jolsa@kernel.org>, Don Brace <don.brace@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, linux-fbdev@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartner
 ship.com>, target-devel@vger.kernel.org, Helge Deller <deller@gmx.de>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Satish Kharat <satishkh@cisco.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, James Morse <james.morse@arm.com>, Jonathan Cameron <jic23@kernel.org>, Hannes Reinecke <hare@suse.de>, Hannes Reinecke <hare@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, platform-driver-x86@vger.kernel.org, Michal Januszewski <spock@gentoo.org>, Nilesh Javali <njavali@marvell.com>, =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>, Karan Tilak Kumar <kartilak@cisco.com>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, MPT-FusionLin
 ux.pdl@broadcom.com, linux-fsi@lists.ozlabs.org, Robert Richter <rric@kernel.org>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>, Borislav Petkov <bp@alien8.de>, storagedev@microchip.com, Mauro Carvalho Chehab <mchehab@kernel.org>, HighPoint Linux Team <linux@highpoint-tech.com>, cocci@inria.fr, "Martin K. Petersen" <martin.petersen@oracle.com>, Sesidhar Baddela <sebaddel@cisco.com>, Julia Lawall <Julia.Lawall@inria.fr>, Sumit Saxena <sumit.saxena@broadcom.com>, Jeremy Kerr <jk@ozlabs.org>, Manish Rangankar <mrangankar@marvell.com>, Ian Rogers <irogers@google.com>, Stuart Yoder <stuyoder@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, linux-scsi@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Michael Cyr <mikecyr@linux.ibm.com>, Ingo Moln
 ar <mingo@redhat.com>, Alistar Popple <alistair@popple.id.au>, Richard Cochran <richardcochran@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, Hans de Goede <hdegoede@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-edac@vger.kernel.org, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, netdev@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

make coccicheck COCCI=$PWD/scripts/coccinelle/api/device_attr_show.cocci`
complians some warnnings as following[1]:

Not sure if someone had tried these fixes, feel free to ignore this
patch set if we have come to a *NOT-FIX* conclusion before :)

This patch set also fix a few snprintf() beside coccicheck reported.
For example, some thing like
xxx_show() {
	rc = snprintf();
...
	return rc;
}

TODOs:
1. Fix other abused cases that coccicheck has not detected. For
example,  ./drivers/scsi/scsi_transport_fc.c has other places using
snprint inside the macro.
2. Improve device_attr_show.cocci to detect sprintf() and fix them

[1]
$ make coccicheck COCCI=$PWD/scripts/coccinelle/api/device_attr_show.cocci
...
./arch/arm/mm/cache-l2x0-pmu.c:346:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/amd/core.c:1282:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/core.c:1895:11-19: WARNING: use scnprintf or sprintf
./arch/x86/events/core.c:2542:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/core.c:2600:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/intel/core.c:5496:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/intel/core.c:5530:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/intel/core.c:5546:8-16: WARNING: use scnprintf or sprintf
./arch/x86/events/intel/pt.c:99:8-16: WARNING: use scnprintf or sprintf
./drivers/bus/fsl-mc/fsl-mc-bus.c:205:8-16: WARNING: use scnprintf or sprintf
./drivers/edac/edac_mc_sysfs.c:210:8-16: WARNING: use scnprintf or sprintf
./drivers/edac/edac_mc_sysfs.c:518:8-16: WARNING: use scnprintf or sprintf
./drivers/fsi/fsi-master-ast-cf.c:1086:8-16: WARNING: use scnprintf or sprintf
./drivers/fsi/fsi-master-gpio.c:721:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:558:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:602:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:792:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:822:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:852:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:882:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:912:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-lenovo.c:941:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-picolcd_core.c:259:9-17: WARNING: use scnprintf or sprintf
./drivers/hid/hid-picolcd_core.c:304:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-isku.c:64:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kone.c:403:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kone.c:412:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kone.c:435:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kone.c:444:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kone.c:454:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kone.c:556:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-koneplus.c:245:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-koneplus.c:312:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kovaplus.c:275:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kovaplus.c:328:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kovaplus.c:337:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kovaplus.c:347:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-kovaplus.c:368:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-pyra.c:286:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-pyra.c:303:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-roccat-pyra.c:324:8-16: WARNING: use scnprintf or sprintf
./drivers/hid/hid-sensor-custom.c:375:10-18: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3100:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3116:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3132:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3145:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3159:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3173:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3186:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3198:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3211:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3224:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3237:8-16: WARNING: use scnprintf or sprintf
./drivers/message/fusion/mptscsih.c:3250:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:211:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:222:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:233:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:244:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:254:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:263:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:272:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:282:9-17: WARNING: use scnprintf or sprintf
./drivers/most/core.c:297:10-18: WARNING: use scnprintf or sprintf
./drivers/most/core.c:309:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:318:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:326:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:398:8-16: WARNING: use scnprintf or sprintf
./drivers/most/core.c:409:9-17: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:466:8-16: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:584:8-16: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:635:8-16: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:686:8-16: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:737:8-16: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:788:8-16: WARNING: use scnprintf or sprintf
./drivers/platform/mellanox/mlxbf-bootctl.c:839:8-16: WARNING: use scnprintf or sprintf
./drivers/ptp/ptp_sysfs.c:27:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/53c700.c:2074:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aacraid/linit.c:1299:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aacraid/linit.c:1325:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aacraid/linit.c:1332:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aacraid/linit.c:561:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/aacraid/linit.c:588:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aic94xx/aic94xx_init.c:267:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aic94xx/aic94xx_init.c:276:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aic94xx/aic94xx_init.c:284:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/aic94xx/aic94xx_init.c:455:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:261:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:273:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:285:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:297:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:309:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:322:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:335:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:348:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:361:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/arcmsr/arcmsr_attr.c:374:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/be2iscsi/be_mgmt.c:1145:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/be2iscsi/be_mgmt.c:1164:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/be2iscsi/be_mgmt.c:1251:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/be2iscsi/be_mgmt.c:1280:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/fcoe/fcoe_sysfs.c:253:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/fcoe/fcoe_sysfs.c:268:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/fcoe/fcoe_sysfs.c:376:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/fnic/fnic_attrs.c:17:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/fnic/fnic_attrs.c:23:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/fnic/fnic_attrs.c:31:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:528:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:538:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:549:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:561:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:645:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:724:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:746:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:775:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:799:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:898:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hpsa.c:908:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hptiop.c:1114:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/hptiop.c:1123:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3483:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3493:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3503:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3513:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3522:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi/ibmvfc.c:3530:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:3619:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:3625:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c:3633:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/isci/init.c:140:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3336:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3382:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3389:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3399:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3409:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3419:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/megaraid/megaraid_sas_base.c:3473:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2825:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2850:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2873:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2893:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2912:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2932:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2952:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2971:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:2990:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3012:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3034:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3055:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3077:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3097:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3133:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3170:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3198:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3320:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3407:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3828:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3848:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:3996:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:4018:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/mpt3sas/mpt3sas_ctl.c:4056:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrb.c:1770:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/myrb.c:1889:10-18: WARNING: use scnprintf or sprintf
./drivers/scsi/myrb.c:1906:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/myrb.c:2143:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrb.c:2153:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrb.c:2163:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1061:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1089:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1193:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1306:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1316:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1391:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1401:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1411:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1421:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:1491:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/myrs.c:942:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/ncr53c8xx.c:8034:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/pcmcia/sym53c500_cs.c:627:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/pm8001/pm8001_ctl.c:883:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/pmcraid.c:3541:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/pmcraid.c:3602:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/pmcraid.c:3635:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:159:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:173:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:181:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:190:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:200:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:210:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:223:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:235:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:247:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:256:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:264:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:273:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:281:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:303:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/qla4xxx/ql4_attr.c:312:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:1112:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:1202:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:231:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:277:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:327:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:385:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:402:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:680:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:689:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:701:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:722:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:858:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:873:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:953:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_sysfs.c:979:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1123:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1218:10-18: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1286:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1304:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1665:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1891:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1915:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:1967:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_fc.c:2000:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_sas.c:1180:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_sas.c:525:9-17: WARNING: use scnprintf or sprintf
./drivers/scsi/scsi_transport_sas.c:572:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/snic/snic_attrs.c:16:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/snic/snic_attrs.c:26:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/snic/snic_attrs.c:35:8-16: WARNING: use scnprintf or sprintf
./drivers/scsi/snic/snic_attrs.c:48:8-16: WARNING: use scnprintf or sprintf
./drivers/video/fbdev/uvesafb.c:1549:8-16: WARNING: use scnprintf or sprintf
./kernel/cpu.c:3013:8-16: WARNING: use scnprintf or sprintf
./kernel/cpu.c:3026:8-16: WARNING: use scnprintf or sprintf

CC: Adaptec OEM Raid Solutions <aacraid@microsemi.com> 
CC: Adrian Hunter <adrian.hunter@intel.com> 
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com> 
CC: Alistar Popple <alistair@popple.id.au> 
CC: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org> 
CC: Arnaldo Carvalho de Melo <acme@kernel.org> 
CC: Artur Paszkiewicz <artur.paszkiewicz@intel.com> 
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com> 
CC: Borislav Petkov <bp@alien8.de> 
CC: "Bruno Prémont" <bonbons@linux-vserver.org> 
CC: Chandrakanth patil <chandrakanth.patil@broadcom.com> 
CC: Christian Gromm <christian.gromm@microchip.com> 
CC: Christophe Leroy <christophe.leroy@csgroup.eu> 
CC: cocci@inria.fr 
CC: Dave Hansen <dave.hansen@linux.intel.com> 
CC: Don Brace <don.brace@microchip.com> 
CC: dri-devel@lists.freedesktop.org 
CC: Eddie James <eajames@linux.ibm.com> 
CC: GR-QLogic-Storage-Upstream@marvell.com 
CC: Hannes Reinecke <hare@kernel.org> 
CC: Hannes Reinecke <hare@suse.de> 
CC: Hans de Goede <hdegoede@redhat.com> 
CC: Helge Deller <deller@gmx.de> 
CC: HighPoint Linux Team <linux@highpoint-tech.com> 
CC: "H. Peter Anvin" <hpa@zytor.com> 
CC: Ian Rogers <irogers@google.com> 
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com> 
CC: Ingo Molnar <mingo@redhat.com> 
CC: Jack Wang <jinpu.wang@cloud.ionos.com> 
CC: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com> 
CC: "James E.J. Bottomley" <jejb@linux.ibm.com> 
CC: James Morse <james.morse@arm.com> 
CC: Jeremy Kerr <jk@ozlabs.org> 
CC: Jiri Kosina <jikos@kernel.org> 
CC: Jiri Olsa <jolsa@kernel.org> 
CC: Joel Stanley <joel@jms.id.au> 
CC: Jonathan Cameron <jic23@kernel.org> 
CC: Julia Lawall <Julia.Lawall@inria.fr> 
CC: Karan Tilak Kumar <kartilak@cisco.com> 
CC: Kashyap Desai <kashyap.desai@broadcom.com> 
CC: Ketan Mukadam <ketan.mukadam@broadcom.com> 
CC: Laurentiu Tudor <laurentiu.tudor@nxp.com> 
CC: linux-arm-kernel@lists.infradead.org 
CC: linux-edac@vger.kernel.org 
CC: linux-fbdev@vger.kernel.org 
CC: linux-fsi@lists.ozlabs.org 
CC: linux-iio@vger.kernel.org 
CC: linux-input@vger.kernel.org 
CC: linux-kernel@vger.kernel.org 
CC: linux-perf-users@vger.kernel.org 
CC: linuxppc-dev@lists.ozlabs.org 
CC: linux-scsi@vger.kernel.org 
CC: Manish Rangankar <mrangankar@marvell.com> 
CC: Mark Rutland <mark.rutland@arm.com> 
CC: "Martin K. Petersen" <martin.petersen@oracle.com> 
CC: Mauro Carvalho Chehab <mchehab@kernel.org> 
CC: megaraidlinux.pdl@broadcom.com 
CC: Michael Cyr <mikecyr@linux.ibm.com> 
CC: Michael Ellerman <mpe@ellerman.id.au> 
CC: Michal Januszewski <spock@gentoo.org> 
CC: MPT-FusionLinux.pdl@broadcom.com 
CC: Namhyung Kim <namhyung@kernel.org> 
CC: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> 
CC: netdev@vger.kernel.org 
CC: Nicholas Piggin <npiggin@gmail.com> 
CC: Nicolas Palix <nicolas.palix@imag.fr> 
CC: Nilesh Javali <njavali@marvell.com> 
CC: Parthiban Veerasooran <parthiban.veerasooran@microchip.com> 
CC: Peter Zijlstra <peterz@infradead.org> 
CC: platform-driver-x86@vger.kernel.org 
CC: Richard Cochran <richardcochran@gmail.com> 
CC: Robert Richter <rric@kernel.org> 
CC: Russell King <linux@armlinux.org.uk> 
CC: Sathya Prakash <sathya.prakash@broadcom.com> 
CC: Satish Kharat <satishkh@cisco.com> 
CC: Sesidhar Baddela <sebaddel@cisco.com> 
CC: Shivasharan S <shivasharan.srikanteshwara@broadcom.com> 
CC: Sreekanth Reddy <sreekanth.reddy@broadcom.com> 
CC: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> 
CC: Stefan Achatz <erazor_de@users.sourceforge.net> 
CC: storagedev@microchip.com 
CC: Stuart Yoder <stuyoder@gmail.com> 
CC: Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com> 
CC: Sumit Saxena <sumit.saxena@broadcom.com> 
CC: target-devel@vger.kernel.org 
CC: Thomas Gleixner <tglx@linutronix.de> 
CC: Tony Luck <tony.luck@intel.com> 
CC: Tyrel Datwyler <tyreld@linux.ibm.com> 
CC: Vadim Pasternak <vadimp@nvidia.com> 
CC: x86@kernel.org 

Li Zhijian (42):
  coccinelle: device_attr_show.cocci: update description and warning
    message
  arch/arm/mm: Convert snprintf to sysfs_emit
  arch/x86/events/amd: Convert snprintf to sysfs_emit
  arch/x86/events/core: Convert snprintf to sysfs_emit
  arch/x86/events/intel: Convert snprintf to sysfs_emit
  drivers/bus/fsl-mc: Convert snprintf to sysfs_emit
  drivers/edac: Convert snprintf to sysfs_emit
  drivers/fsi: Convert snprintf to sysfs_emit
  drivers/hid/hid-lenovo: Convert snprintf to sysfs_emit
  drivers/hid/hid-roccat-*: Convert snprintf to sysfs_emit
  drivers/hid: Convert snprintf to sysfs_emit
  drivers/message/fusion: Convert snprintf to sysfs_emit
  drivers/most: Convert snprintf to sysfs_emit
  drivers/platform/mellanox: Convert snprintf to sysfs_emit
  drivers/ptp: Convert snprintf to sysfs_emit
  drivers/scsi/53c700: Convert snprintf to sysfs_emit
  drivers/scsi/aacraid: Convert snprintf to sysfs_emit
  drivers/scsi/aic94xx: Convert snprintf to sysfs_emit
  drivers/scsi/arcmsr: Convert snprintf to sysfs_emit
  drivers/scsi/be2iscsi: Convert snprintf to sysfs_emit
  drivers/scsi/fcoe: Convert snprintf to sysfs_emit
  drivers/scsi/fnic: Convert snprintf to sysfs_emit
  drivers/scsi/hpsa: Convert snprintf to sysfs_emit
  drivers/scsi/hptiop: Convert snprintf to sysfs_emit
  drivers/scsi/ibmvscsi: Convert snprintf to sysfs_emit
  drivers/scsi/ibmvscsi_tgt: Convert snprintf to sysfs_emit
  drivers/scsi/isci: Convert snprintf to sysfs_emit
  drivers/scsi/megaraid: Convert snprintf to sysfs_emit
  drivers/scsi/mpt3sas: Convert snprintf to sysfs_emit
  drivers/scsi/myrb: Convert snprintf to sysfs_emit
  drivers/scsi/myrs: Convert snprintf to sysfs_emit
  drivers/scsi/ncr53c8xx: Convert snprintf to sysfs_emit
  drivers/scsi/pcmcia/sym53c500_cs: Convert snprintf to sysfs_emit
  drivers/scsi/pm8001: Convert snprintf to sysfs_emit
  drivers/scsi/pmcraid: Convert snprintf to sysfs_emit
  drivers/scsi/qla4xxx/ql4_attr: Convert snprintf to sysfs_emit
  drivers/scsi/scsi_sysfs: Convert snprintf to sysfs_emit
  drivers/scsi/scsi_transport_fc: Convert snprintf to sysfs_emit
  drivers/scsi/scsi_transport_sas: Convert snprintf to sysfs_emit
  drivers/scsi/snic/snic_attrs: Convert snprintf to sysfs_emit
  drivers/video/fbdev/uvesafb: Convert snprintf to sysfs_emit
  kernel/cpu: Convert snprintf to sysfs_emit

 arch/arm/mm/cache-l2x0-pmu.c                  |  2 +-
 arch/x86/events/amd/core.c                    |  2 +-
 arch/x86/events/core.c                        |  6 +-
 arch/x86/events/intel/core.c                  |  6 +-
 arch/x86/events/intel/pt.c                    |  2 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c               |  2 +-
 drivers/edac/edac_mc_sysfs.c                  |  5 +-
 drivers/fsi/fsi-master-ast-cf.c               |  3 +-
 drivers/fsi/fsi-master-gpio.c                 |  3 +-
 drivers/hid/hid-lenovo.c                      | 19 +++---
 drivers/hid/hid-picolcd_core.c                |  6 +-
 drivers/hid/hid-roccat-isku.c                 |  2 +-
 drivers/hid/hid-roccat-kone.c                 | 12 ++--
 drivers/hid/hid-roccat-koneplus.c             |  4 +-
 drivers/hid/hid-roccat-kovaplus.c             | 10 +--
 drivers/hid/hid-roccat-pyra.c                 |  6 +-
 drivers/hid/hid-sensor-custom.c               |  3 +-
 drivers/message/fusion/mptscsih.c             | 25 ++++----
 drivers/most/core.c                           | 61 +++++++++----------
 drivers/platform/mellanox/mlxbf-bootctl.c     | 14 ++---
 drivers/ptp/ptp_sysfs.c                       |  3 +-
 drivers/scsi/53c700.c                         |  2 +-
 drivers/scsi/aacraid/linit.c                  | 17 +++---
 drivers/scsi/aic94xx/aic94xx_init.c           | 15 +++--
 drivers/scsi/arcmsr/arcmsr_attr.c             | 40 +++---------
 drivers/scsi/be2iscsi/be_mgmt.c               | 20 +++---
 drivers/scsi/fcoe/fcoe_sysfs.c                |  8 +--
 drivers/scsi/fnic/fnic_attrs.c                |  7 +--
 drivers/scsi/hpsa.c                           | 36 +++++------
 drivers/scsi/hptiop.c                         |  4 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                | 22 +++----
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c      |  6 +-
 drivers/scsi/isci/init.c                      |  2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c     | 15 +++--
 drivers/scsi/mpt3sas/mpt3sas_ctl.c            | 60 +++++++++---------
 drivers/scsi/myrb.c                           | 38 ++++++------
 drivers/scsi/myrs.c                           | 56 ++++++++---------
 drivers/scsi/ncr53c8xx.c                      |  2 +-
 drivers/scsi/pcmcia/sym53c500_cs.c            |  2 +-
 drivers/scsi/pm8001/pm8001_ctl.c              |  6 +-
 drivers/scsi/pmcraid.c                        | 11 ++--
 drivers/scsi/qla4xxx/ql4_attr.c               | 48 +++++++--------
 drivers/scsi/scsi_sysfs.c                     | 34 +++++------
 drivers/scsi/scsi_transport_fc.c              | 34 +++++------
 drivers/scsi/scsi_transport_sas.c             | 22 +++----
 drivers/scsi/snic/snic_attrs.c                | 10 +--
 drivers/video/fbdev/uvesafb.c                 |  2 +-
 kernel/cpu.c                                  |  4 +-
 scripts/coccinelle/api/device_attr_show.cocci | 10 ++-
 49 files changed, 343 insertions(+), 386 deletions(-)

-- 
2.29.2

