Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE054C16A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNF6K0NSTz3cCP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=KAmO7Udz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feab::813; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=KAmO7Udz;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn20813.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::813])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNF4K64Bpz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 15:59:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niz950VfSqAzoSS0x6hEnvRUm5TYVppwx9X/JswCH/g910vURhOBNKKQn+OaU2MwByIxFBXIJvp51BJVTjYn9pA7QYcP88TSEUjCPdI55PQD9yyUlnMUwuj3Iy+Oeh3KUi+56vQ93S3wySqC1a1Mq7qHCtbMNPprBGjEle5Q06CO4TuJY3Ld4u52/d+fMLVNc8xgAzcvf53IEYCEU/HPeNI/Q/AFvgJUD2sJZazk3/w1AJ3Uts9pcNuxgcvC1TWRaADfaVd2fvToIK8AD41Zp03Qsa2ooD3iPuU3f2vWpW/VAB48wmgtKnueTBtt6ht1IdVThW2LBsSbjc/NbctHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoWTgHqQWDed18GGHbmGrw3lfbNF/TG1jvipXAb8rQU=;
 b=jqvEh4wr8wzc5CFRqFOMIzv2/kp6mFdPtKS8Nyn0rhjlr0ebn58fcSvkkTB8+TdmjEadWsccFwPJy79xozyy09R2haylpdQTBwGUiM0hSghTXO5Cj9OQHXvI0qQTT5szvdGwDLWfMk4zsjhjzwqGCuvX1Tq9AAjuNK4aoevrpcmD+duDbwtATXAoiRgTtr714qYCzw+aBU+d7Q/HoUAobubWQy0ncT0HQbGrJ8dNvoAiINq0VC2XCSCONkm6+x88pPaCr0Jh3YaDTiQg45SWIlri4nxw4AM1+vnpE4kWHHpYoqK8v3WoZS+fXKRFTBN15CfrYcJODmuRfCdEQ2gsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoWTgHqQWDed18GGHbmGrw3lfbNF/TG1jvipXAb8rQU=;
 b=KAmO7Udz+hiSeLytfU5w8Nysniag94+j2HwV/tREY5F/OlPeFXWwEpKM8N6dmc92w0+9DmVeRs4LhVukTEVNUCDv0txvgCQP1gLB8NYVV1DCUVShqmapPY1dMnP2jOqvWDvGGOgM4Et7aS0PdhymwDtQPLfHiTjPhUpv9Srpaqw67MLyut4FHcXVYZMpqFSLuFBynqiZ+avgPDW7fH83QdInCYh8cr3SRcNXfypF4stYTF4l8jon+mKfSWoc8EK/JGJDBRjTlnQvrp9okM2P6O3sk5esxfrv+RLelanLi2C0Uz/bawh0JICSr6zIo74X+i3pyMKgZ6VPeoofgDmziA==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by PU1PR01MB1947.apcprd01.prod.exchangelabs.com
 (2603:1096:803:19::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 05:58:52 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 05:58:52 +0000
From: Wang Wenhu <wenhu.wang@hotmail.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hao.wu@intel.com,
	trix@redhat.com,
	mdf@kernel.org,
	yilun.xu@intel.com,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-fpga@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCHv2 1/2] mm: eliminate ifdef of HAVE_IOREMAP_PROT in .c files
Date: Tue, 14 Jun 2022 22:57:34 -0700
Message-ID:  <SG2PR01MB295111ED8F547B9F99DB9FA99FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615055735.53585-1-wenhu.wang@hotmail.com>
References: <YqHy1uXwCLlJmftr@kroah.com>
 <20220615055735.53585-1-wenhu.wang@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [7E9NYvd8mRfjcrI2nMEDA6xwFWiiOlo1]
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 SG2PR01MB2951.apcprd01.prod.exchangelabs.com (2603:1096:4:76::15)
X-Microsoft-Original-Message-ID:  <20220615055735.53585-2-wenhu.wang@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e58221-e413-4278-e2f6-08da4e941fac
X-MS-Exchange-SLBlob-MailProps: 	AsidyrAlbSQZHKAyKdVUDqca3EJTCyiEi2anrgjSN7Q434rtpcb9uwn/MSx6xPgMSvLQllnpSq05GfWD3FQfeIAZTe3ahriHZC/8895TRKi033C/90t2ImAGdLmvYwP6qCaWzzGT+m3aPJpmQ7S59mo8e3I8Csw3w1P61Zjbh4cL+8pgareJQfuXGmpuXZsLilUqF517QdJBb/dxhSOnGtMGuYoSbr/AC31MYwJj9dJTHkdk4rQmCtZCyYGBYgDkN56qvfgQ7/tmcebQKmYotI0SgSAVAmQ23hlbi7tVJfc8QCIggEXrNFTFMLMmI4CkaaLouKdbuJOH8/OeF1pvzBg43nvR+nFxd0c18eDAbMOTMvOuNT9Z7U1YjOtIgvB6bOSI1OHr09moomwiz/m8/FVg6UTSXDykZPqFybxneVBPZOLD8tagDVhCRBcXAFm64E88B1zmZZdwVvEy1MJnBpCgXrir/1ksK6q+KIpAkFunmAen8KLAvBb1amamin4Je9v1zpsmGtPNu5N6a/No26oTmH13j1yUL8jVp57ugecj19O5m5KB9CagH5ChmLAwMXn+nTCo8ApqrxEbfPJH95gcMCj9Ss3layj2T2CWPFpZwULIpT9pyX8TGwZVygmyEPRRVDzgWJ0ZjA4hXqm4nDDKik+FykWdMdQiqjSoe7IfxMAgrMEsg2ys2jDKW9cvKGej5k2m8cfuJo/dOX4HvXvaA/7jWEVL862S2BB+vSEV/fyVwHHaJFdy3Nvas2x7wJ+Rm7Qk/WZfjagNIoZTxY7+9orvN1JF0OhzHEjzk0WT8ZkGcJ8En2RySROXgt2MJaQ0aB9k3Lq/m/vbDryuVA/OSD+f6cV+
X-MS-TrafficTypeDiagnostic: PU1PR01MB1947:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QG0rkDp+OsNsqSoW3zKboFUWatdBiEi9B+4weg/4H7wMiRJQRqshf7fF6yDtIB4tjuHJkqJOsvJ6SuNWru1y3qN1qcAEA3/kpGAOM/xrU28ulpV5o7P/JNx0eGWtlxlOZ8nJTEgfroSTAcrpH+63SB231zYFgptaOXRyAYbrcftobnfYytvPQRgGDBuzQqfsEi+I75tKxn3YpjG4c929bYU5IfzTIRUs5dG8c5XzO5OyyLimV8I06zxQHi2k7WWD65/Yc7vnLmcm5e8TeTqyEKbC/U57C2ufPApny7MPA2aQ5zXltnwPMbCS7ZABZ24UUbQ+YcbytTdsODfVwSv9iCCkypSprcPIUYrPoWRbFOInMuaijNmmKA1SX9ldSj8/qbavOl7KUpyXoLi7s3zxpnAmc2R8E2aPbO9paD5bksWLaTj7byGIqcDePfTfxC1lAniUUYBEwFTNY/EmEyYIUjGA+hTjCH5pUXI7QIRQ3Qzp/i46CRlyQCb3W3/TUpzy94AL5HmTKhVKvTOinmrWR81qDC9EnzjeC+YQ0YKxCPFMGmZTc6imTwzyY0Pc6L+IDWQ9PMd5msYE72KnfSBtFC+cNB6WlWptKUG58rpvZ6SAz2Wxe43Qs5GlooaqLlmf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ixZWEh6+LhNB42+fp36hD2ALGQHmmndFk5pOmTqKXJ+l+ITbaCh4fYxPRZAR?=
 =?us-ascii?Q?5VV4CA9NetC/2Ni24SN818FFkOrRrx+QcC3zNuNyBMlvROiM9wwehkVecMtR?=
 =?us-ascii?Q?1+FnTN/VJ4NYOmIbZ6cZAgV/sF1N5KDhu/CPo4U49Vkslj8k98qrp5ZE3anz?=
 =?us-ascii?Q?wi1EdP5i2zszds8ymKNFFpvYUS7Czt28R04HTkRORuEXl6/OT1Br8hR+9LrS?=
 =?us-ascii?Q?swfJ2y1/f2ISweiZESxQNEcTrGmAcAScB5dFmEM36o7EwAT3jFRuuvqjGZXp?=
 =?us-ascii?Q?IaAMkbi3kn/y57gPG8oQcmpxtyBZ7FrvSouwVTwtS/RyiXJE5gYum2NECPJz?=
 =?us-ascii?Q?wAmpP+9p0mbBCok5zRrcV5W79+6LQWil5u5HqjTx6Q6CpwQAF8Uwc5njyaZr?=
 =?us-ascii?Q?1oDSPUrvWySqeGhsR6CCc8lBa2fmp4m+iYWFTbBsmEclI7CMkxSnc2PobwY8?=
 =?us-ascii?Q?m3nSh1qswnTW/uHDWkgSnPy7+ZplEs7KoyED1kxsqWVJ9VIDazAQuYDn409k?=
 =?us-ascii?Q?YHg32FiLs/Sp/uibj0/JtUexNbTOUtjrW2DWVwHvA4IOiuROSRqShBb8DJoy?=
 =?us-ascii?Q?5yyIWbvsfyZPs59sl6b7xLdeswNbMNkUE/dsEZ4+CV41K6uzrBN9dK9ZlqRv?=
 =?us-ascii?Q?7NRzw7FahlYtxJiOiEAKtm1tc6Mt87dGos/70hA6Ryp8P/ck/TcgBkOUI5WE?=
 =?us-ascii?Q?8nRNMu5d6zmTvukhX60f+ORe+lt15p6Jpb/o3lEEzHa+QpIR2bp5HkRp22Ha?=
 =?us-ascii?Q?uosTbVKTo6WIDsPlCISGAfF9xQW2bMHgl0u9Uk/IDhU1nah6ITwSyhGFXeBK?=
 =?us-ascii?Q?9RSYL+kxcTIgWnQqordeI4BC8jFVJTPw+o+rgAyuuYjKsqk/5qF7XoEPpgUw?=
 =?us-ascii?Q?vyPM8xoIr1DDb/ZIfi+5co6J5xLuiNlyR9/XYVpd/yeZRnCRKapzdsckI7wj?=
 =?us-ascii?Q?/IcSVAAcZ682N+PBIl0McItARaHhaUR9AfUblWVMrRQRa3anG4t5IJXJt1y+?=
 =?us-ascii?Q?aHoQwVFojp9LUZYj6V5Nz+/zSD6SJgQHgozXZIY/cJcKBjShNlSmV0F6ZmJw?=
 =?us-ascii?Q?y3wRej+CuVufAacyNdYyafn5GuaSlaP+qjeHecBX0xM62oVxmmCId1IsNOoO?=
 =?us-ascii?Q?5MiKZP/gaOt7EsEeQSv012Istnit7W0UJ3wkh5TfTTHD7+I83GMN1UwMSXxO?=
 =?us-ascii?Q?jtMZkbRItXzX/p35TIuq+N4GAODCjjzx15B2K7seDBB8uQG9LI0e8zsrw2dD?=
 =?us-ascii?Q?lG3o3B6Up6+OB75Gh59YCtz7aJZBoA4yL231pR8Xf6ZXFE3pXG+4nl8rgLyx?=
 =?us-ascii?Q?CqaXpYeecb45CTektP4/nAH+JQ1tVhu2FEYwqTZX/lpq98bFQdKPKD5sHUpj?=
 =?us-ascii?Q?GAATlNVH8S2A6kn9PC6v0q/H1uZ0znycb34MmrtDRhWxO/l/7rVOwLbDbTAq?=
 =?us-ascii?Q?4ic8FMZgOkU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e58221-e413-4278-e2f6-08da4e941fac
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 05:58:52.2084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR01MB1947
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, wenhu.wang@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is recommended in the "Conditional Compilation" chapter of kernel
coding-style documentation that preprocessor conditionals should not
be used in .c files wherever possible.

As for the macro CONFIG_HAVE_IOREMAP_PROT, now it's a proper chance
to eliminate it in .c files which are referencers. We constrict its usage
only to mm/memory.c.
HAVE_IOREMAP_PROT is supported by part of archectures such as powerpc and
x86, but not supported by some others such as arm. So for some functions,
a no-op version should be available. Currently it's generic_access_phys,
which is referenced by some other modules.

Signed-off-by: Wang Wenhu <wenhu.wang@hotmail.com>
---
v2:
 - Added IS_ENABLED(CONFIG_HAVE_IOREMAP_PROT) condition in __access_remote_vm
 - Added generic_access_phys() function with no-op in mm/memory.c instead of the 
 former one of "static inline" in include/linux/mm.h
Former: https://lore.kernel.org/linux-mm/YqMRtWAH5fIWsLQB@kroah.com/T/
---
 drivers/char/mem.c          |  2 --
 drivers/fpga/dfl-afu-main.c |  2 --
 drivers/pci/mmap.c          |  2 --
 drivers/uio/uio.c           |  2 --
 mm/memory.c                 | 13 +++++++++----
 5 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 84ca98ed1dad..40186a441e38 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -354,9 +354,7 @@ static inline int private_mapping_ok(struct vm_area_struct *vma)
 #endif
 
 static const struct vm_operations_struct mmap_mem_ops = {
-#ifdef CONFIG_HAVE_IOREMAP_PROT
 	.access = generic_access_phys
-#endif
 };
 
 static int mmap_mem(struct file *file, struct vm_area_struct *vma)
diff --git a/drivers/fpga/dfl-afu-main.c b/drivers/fpga/dfl-afu-main.c
index 7f621e96d3b8..833e14806c7a 100644
--- a/drivers/fpga/dfl-afu-main.c
+++ b/drivers/fpga/dfl-afu-main.c
@@ -797,9 +797,7 @@ static long afu_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 }
 
 static const struct vm_operations_struct afu_vma_ops = {
-#ifdef CONFIG_HAVE_IOREMAP_PROT
 	.access = generic_access_phys,
-#endif
 };
 
 static int afu_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/pci/mmap.c b/drivers/pci/mmap.c
index b8c9011987f4..1dcfabf80453 100644
--- a/drivers/pci/mmap.c
+++ b/drivers/pci/mmap.c
@@ -35,9 +35,7 @@ int pci_mmap_page_range(struct pci_dev *pdev, int bar,
 #endif
 
 static const struct vm_operations_struct pci_phys_vm_ops = {
-#ifdef CONFIG_HAVE_IOREMAP_PROT
 	.access = generic_access_phys,
-#endif
 };
 
 int pci_mmap_resource_range(struct pci_dev *pdev, int bar,
diff --git a/drivers/uio/uio.c b/drivers/uio/uio.c
index 43afbb7c5ab9..c9205a121007 100644
--- a/drivers/uio/uio.c
+++ b/drivers/uio/uio.c
@@ -719,9 +719,7 @@ static int uio_mmap_logical(struct vm_area_struct *vma)
 }
 
 static const struct vm_operations_struct uio_physical_vm_ops = {
-#ifdef CONFIG_HAVE_IOREMAP_PROT
 	.access = generic_access_phys,
-#endif
 };
 
 static int uio_mmap_physical(struct vm_area_struct *vma)
diff --git a/mm/memory.c b/mm/memory.c
index 7a089145cad4..7c0e59085456 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5413,6 +5413,13 @@ int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(generic_access_phys);
+#else
+int generic_access_phys(struct vm_area_struct *vma, unsigned long addr,
+			void *buf, int len, int write)
+{
+	return 0;
+}
+EXPORT_SYMBOL_GPL(generic_access_phys);
 #endif
 
 /*
@@ -5437,9 +5444,8 @@ int __access_remote_vm(struct mm_struct *mm, unsigned long addr, void *buf,
 		ret = get_user_pages_remote(mm, addr, 1,
 				gup_flags, &page, &vma, NULL);
 		if (ret <= 0) {
-#ifndef CONFIG_HAVE_IOREMAP_PROT
-			break;
-#else
+			if (!IS_ENABLED(CONFIG_HAVE_IOREMAP_PROT))
+				break;
 			/*
 			 * Check if this is a VM_IO | VM_PFNMAP VMA, which
 			 * we can access using slightly different code.
@@ -5453,7 +5459,6 @@ int __access_remote_vm(struct mm_struct *mm, unsigned long addr, void *buf,
 			if (ret <= 0)
 				break;
 			bytes = ret;
-#endif
 		} else {
 			bytes = len;
 			offset = addr & (PAGE_SIZE-1);
-- 
2.25.1

