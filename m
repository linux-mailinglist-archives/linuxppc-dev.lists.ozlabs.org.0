Return-Path: <linuxppc-dev+bounces-7598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0BEA85658
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 10:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYqK54fWfz3c6b;
	Fri, 11 Apr 2025 18:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.166.238 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744355969;
	cv=pass; b=jyG2GbIEIY2wD+jYkzsmCKYDAELxPciAzfyC1G9Q8ycga1Hpxc/trcyL3xT9uVWl5ix/aaX31d9gKO6dUW84J7htnBy6HhMBjdm2dKxf0U2DqNT5uiA8INl/GYIAa9zHf+s0SPpNPd6nGWnQIT5C9AaAf8L81XLdMRuYYnLmy+dA80L/cxx3chnGT3BWhY053fCV5K/Kl6nhaA4wiOxpAQBJnL2Oti7d7bQqBj4ibB9PvdBDou1J4SYpPLCjmWftPnWYX2BplE9LSnE+8Q02u6HaJn9DOMxGIRDrTREMCDurpenUKOCBb04eCszsQizaXcAnHfCyqrN0sr+3pbEVAw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744355969; c=relaxed/relaxed;
	bh=x8nvZWYB2E5aPnzYGZ/21oP4C849tk/EIk3kAFnZOZg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Xe3v5Ghz5Cs1H28Ong0C642puOVgOJRelFo8AGyXYylNVUFSaFa2WgJ7l+mFbn6IRPH8mV/dQS6h9qaNaH9cRzEE0kA6/DIbyEe4pr7oV2ShlblrxyLNVKsI/dytsaoq86eNJkdjCorPui5EoH7wxN0QRG02RCB/h2FXczyj3dhcfEP/5qWC+hEeAPsLkkyBNXLIlqvSJAEDNcbuP7cAxUMhnHu/CWOLvk8Ghm2Njo12kkCTI3f/02RLWNAw1F+Wa/Q/J983nozTIiI5WhM0GY5tCS+ZFzkIH94ni4hsZBZoakxs32va65UHHAYlz9tO0H/WIfSXkR+hL/evRCTzjw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=61962bd2bb=donghua.liu@windriver.com; receiver=lists.ozlabs.org) smtp.mailfrom=windriver.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=61962bd2bb=donghua.liu@windriver.com; receiver=lists.ozlabs.org)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYp3422D0z3by8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 17:19:27 +1000 (AEST)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5bAcp009243;
	Thu, 10 Apr 2025 23:42:31 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4fpkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 23:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv1yu4MoX80EKdkBuHXyu649U2AP/7BJQIsj1hNG+6UHOREuv8qHxUM0i8U6EjpeoJDR3lZ8tIzSnMETQHNUzSRCJMtT17Aqc6I2DUz4JG25yvxTxw5ghbDc4pomXUSnZZIur/gMHaoyX+RnCRRoKAG9NDfmjAyDMf17Z8hxhdDP2UEXOGpK5XNrv0BO1ych3igbbqK4bCkigEOkBj1RamjtnGBWjCB8HaGisyXUqKKrZBNhhDlnMNWBe4AKRHUza3++KNerhjRmqvdqvRm1xMs78RqEnNAQKQfHk2PGIJ6PezdHvLv7yMfH4BGegWImYQ+MKi77m6lcXdL2y+5pTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8nvZWYB2E5aPnzYGZ/21oP4C849tk/EIk3kAFnZOZg=;
 b=jJt2i7XNmNKXVJkNuc/z4CXgvdcTAmqRLYPCDTSns9szbq6CIz4Mrjt9hXRXshyRttz7lKG0S0s78lxH6qG4jeHdlsoFctd0FDAhkvmr/XiiLGmG0iE7wZFd+TxGh7Q8MI+0ir6xdA9bJxG5oXdAlJXnZWRUZQLukjKcyurYrRQ8y6x/ZkbCscaXw9rNI644ccydVQHZriwmIpc9ulZw2A7AmNCMnbboZbU6cVAH/KQi4r9sorOG3qfp/XogCFazxjiS9m241iQ4wJK8vUT//utgSOPCOAAEVip9bGlkL0ZR9vhiqDNN6Il7Vy2xck4TjVu9qU+w4onMhkR6qkZaWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6)
 by IA3PR11MB9228.namprd11.prod.outlook.com (2603:10b6:208:57a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Fri, 11 Apr
 2025 06:42:28 +0000
Received: from CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d]) by CY8PR11MB7012.namprd11.prod.outlook.com
 ([fe80::83d5:946f:3692:8c0d%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 06:42:27 +0000
From: Cliff Liu <donghua.liu@windriver.com>
To: stable@vger.kernel.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        leitao@debian.org, nathanl@linux.ibm.com, donghua.liu@windriver.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Zhe.He@windriver.com
Subject: [PATCH 6.6.y] powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
Date: Fri, 11 Apr 2025 14:42:13 +0800
Message-Id: <20250411064213.3647619-1-donghua.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To CY8PR11MB7012.namprd11.prod.outlook.com
 (2603:10b6:930:54::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7012:EE_|IA3PR11MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a49521-7890-4ec0-fd4e-08dd78c4062e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2+L4GEtsFFuzJgPUlrtmXVDI7cCD+xMtC30aHhc7Tc5eZngtsNp8SneD0bOx?=
 =?us-ascii?Q?erD1x2gURMcV5dWtWXPXwH2WQzJR5gGGSXvh8A5AMK1rFmcupfaqYLH4vBnc?=
 =?us-ascii?Q?IHZYLjxpgYM6rfUQfFGRuQXz/XexR++7+3lBi+O9m49j6puzmTHNVaAjob6q?=
 =?us-ascii?Q?Yca/rvCxVHfzFBtGMRpsYGmy0rTkCp6MTGgDOlcgm8MzivpkNHLbQ5o6PTJB?=
 =?us-ascii?Q?QuOluHyzery/rhiauErinpDT/AdDnSQtUlDm7YmKj3g+1uQO5LhgbZIqPscA?=
 =?us-ascii?Q?Nw3ZDBMT21H26uwYPliiYtxSHusz3K3knsxHnVMM37NGY5Lttkt8gMXXeBNi?=
 =?us-ascii?Q?srE7i3ZD/acEIlgtG4HUpYM9fDdnYTQiSFSrw9bUvcn2EaA0OTzHMrtzIAkD?=
 =?us-ascii?Q?mjmDyVcXMEUSK/uvixswusCLJesiukoLKtRxgCUGiwxcSAON0dlzzCpXPwLF?=
 =?us-ascii?Q?mMWh0oNHVPtyDgUNCROa5jqIg0FNzbCJxNg6SZRU/J+yKLxG7hL6IH8xHSES?=
 =?us-ascii?Q?2Tu5fCIqpFalRWRgcOltvHthVhaq2eIMAkpxNfTJwqAFeFkP6Q6nozU7VrSr?=
 =?us-ascii?Q?cJISA3fcQePwVot/hnfO67YeDpDckPCjbJjpQzqpKgneEe9F7hj5pwBkyaXz?=
 =?us-ascii?Q?oevi4RWO9TXEIzGroIc103CUenp2ZdOn59YhUtMCmSGStNyRmHjxWPv3kmyV?=
 =?us-ascii?Q?yjRldYWE2ek+OCP6oy0yzqB6ddngzPxSvD+dlE5lEKK47vrWfM1DXDNhDA9F?=
 =?us-ascii?Q?9FxGkVl4ZjL9cpM5kwHySQhtgk6F9CWUmlgu9C0yS4HwumXNEMeHDntR+jjl?=
 =?us-ascii?Q?f3q282iMUnJ0Yqe6RQCRL+/hooAfY6RmSBBeSnpBZdE/2NHHC5Bk7SuK/VbA?=
 =?us-ascii?Q?jn0B3ubgsTy1RdSRtCrad5EQ5bxF7m3XkufLsCD8BJQZrEOiKCpdUtgSKgyw?=
 =?us-ascii?Q?kCqYiW9abBjuFfPM1ATQGjF7g7uoAZmwCnHA9m3uFO2UZUAGW6iXMMksxinE?=
 =?us-ascii?Q?6+w77UjWQH7Jmt0cV3e7bMbqbUQrVJPcvFq4psqZqmobTc7IFLpE4ekOpKLk?=
 =?us-ascii?Q?m6UgP95yFT/PqjaILOfMj5chKcqTBjbmUgISRO68ZE6HaI1xUjf/gMBcoM/R?=
 =?us-ascii?Q?DhyZ7E2eezaMqUKWz+fYlntlAzd1xpJuvAMWMgQfDll73j3PzkttVVa8O/yz?=
 =?us-ascii?Q?XFvOPDLLn6TKOHxhZlAE63ny9b8IAbAj8xgliH8MJsREoQmOJWRta94nmjwi?=
 =?us-ascii?Q?FwS81xUtrezR8Wh66X3hWu5Tuf5yij2G6OePZ3Q5oA2JHQkVNMumvDgg6Lpa?=
 =?us-ascii?Q?RhG5MoQvKTpP5ykrfhyoVJ+2SM7UmGeW2U1vw5HFIjYZSrCzH6kTUKfq/rvV?=
 =?us-ascii?Q?RQA0CTVosN9xan4rkJw9KfUya0i9X8QFg+/mf9IwKwERNpFNygsnZRiU379Z?=
 =?us-ascii?Q?Dw47y6ZOfMM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7012.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3dJnwvcfgauWsgkKEA6WsEBUOkAmgMGnw71b4jxYradRxBrVLvaRk5XOFrkz?=
 =?us-ascii?Q?hWdMV83R8FEiB7ziloZFNyLff4BB2GXpr/DW/T8qLv/CQd7FS+iDQZxWgyiA?=
 =?us-ascii?Q?ki2k5tLmfcTBJv77g54VvdnRmP7QRnlZKviAH/MUz8COhokCRPm9jXNb+cZS?=
 =?us-ascii?Q?lEDvGNnsunfsvWFblYmO5ANM/P/pXCprgp6UKSsohqadrtgRgjDLC3p0jT3s?=
 =?us-ascii?Q?GrZsjyify7jFykdfvGVZJUhuB/C1JLkoO7dI59/pBi3kfrlEqyP/h0KCGhqS?=
 =?us-ascii?Q?PxKD5d58R2O1q3AsQWDG5X04Dv8Ta3C4ydpw+BUBaxIQaDOXnQP+0tNWAypr?=
 =?us-ascii?Q?Gvj5hmMpGWjDn4uTOwYZY+DGEe/r3tkycqyXE1/zLEkID+Y01t6UsD2TX0rQ?=
 =?us-ascii?Q?T6rdo+h9Vr3c2isat63TR1/Kmhr1LoSnGIVjjen/ga8WvSfqDY5x+OBX04d4?=
 =?us-ascii?Q?O/8iy7vrutVbZju97z3i63rUxDNv1959pb4NwB2a+XltLCUtSbMtou3JDyWw?=
 =?us-ascii?Q?Q289knSKlX+1GJBdpG7nVwde1Ow2WiRrMAFqHkV3BiEzvEHEsYRv8eYu6IDx?=
 =?us-ascii?Q?+NctAWPFNP10UOV5wDMWrNeV0KA6XMh9WNIR+FHw6YPqP9qF3oUlG3S3NXyw?=
 =?us-ascii?Q?sWfB7NoSeqa46HKA2Kj45de3eTdtRKqb7Eq5akwG50PWFzHvlWGeR8CqT/c+?=
 =?us-ascii?Q?wegnVBRmD4ZRQ/GE3f7SXeY5MNcRY6R/LlX8bbal23PmghxcORWH/ZpnNgET?=
 =?us-ascii?Q?eWzN/WUkzhoaQJVLojtbeVDBryKxmQ9qQIWHdvUKQw9850+qYIfUwn9YD0PK?=
 =?us-ascii?Q?zNZyIO0RdBuq8hC68Z9GxWTIL3usiCW/ftlh6hP5S550KhJ6fVMoI3O/R2U0?=
 =?us-ascii?Q?LNbg2JnYqhyOIxMk3aVgi4B+1C2Q8n1mUIhY+LxlRkJgi6pFLOKoqZS8tps7?=
 =?us-ascii?Q?1r/40ssE7WSVETOq9fH35g7oqqA5OMlCCRHE+Di1H6i+Moxk9M8Rowvoh3Xk?=
 =?us-ascii?Q?Df6S5D0BMONIMeOU3folgJb1GkRmi4trm1Oze7OZ1L65hy+En6cynoI1Yt0K?=
 =?us-ascii?Q?he+kL7srtOWjcnSaSc5CXW3C5P3xWE54k2tLsfPZ5keJOQJ3KSXOtZDAgzeK?=
 =?us-ascii?Q?jLB6/e3TXKiI9YofRcKv948FKubREg7ZX+Y0xILaIjaCSLwPoqZ71aogr+ZY?=
 =?us-ascii?Q?CeaJ5t7t3t8KzJPorDIHQBTOoucyFj3T+1f6u54hcSiw5bfeH9UshB/pbbPG?=
 =?us-ascii?Q?nInO9G5B9tl6wEP8DepQRhm1aHyMNaCdXKTCmmbi3dBDmFbz28WHh+52KJM6?=
 =?us-ascii?Q?NvZhZgS5gXjN7P7pClBZ94ksGu84FSbczKsVNe5D+R4KArz2yhADcr4wf9P2?=
 =?us-ascii?Q?8yplj/DI6umhNZyknQwlgIrchbkRKZHqIbp9Q2IlDzA5z8ZcAsLXh+P+cUeg?=
 =?us-ascii?Q?85dXivlR5l68grTiw15W8fK187fcI++fTSpsBxZlQanMdrVbQ1GnVSkWmify?=
 =?us-ascii?Q?nYMBpnaZ6DDXUOytZhev/TGgsgJgFHeCjBoszVPE9IRAhOPmn+hmcI4kB8D2?=
 =?us-ascii?Q?Q5Bx8BnI3Pu2hW6osUu15d54tEtLfyNGE61n1Qso9F9PgmU2iJTLdNNDpOCS?=
 =?us-ascii?Q?CA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a49521-7890-4ec0-fd4e-08dd78c4062e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7012.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 06:42:27.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iciY/KCKXEpA0cRFvX65UDUmUEo9xNTefeVqCDG/erpqnxuPI3Ii8hsW37kwvEGIQXMaBLYOGYRU0q69mbspqO9GYplGMPySFk1arAIperc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9228
X-Proofpoint-ORIG-GUID: bePLiSfUIHEfa-KKgwRsA4KG9ZiXTd8F
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f8b9d7 cx=c_pps a=1mby/iHf9ieL9308fKykyA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=bC-a23v3AAAA:8 a=VnNF1IyMAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=u2LiicgN0kIDZIMe9SoA:9 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: bePLiSfUIHEfa-KKgwRsA4KG9ZiXTd8F
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504110047
X-Spam-Status: No, score=-0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit 0974d03eb479384466d828d65637814bee6b26d7 ]

Smatch warns:

  arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
  spectre issue 'args.args' [r] (local cap)

The 'nargs' and 'nret' locals come directly from a user-supplied
buffer and are used as indexes into a small stack-based array and as
inputs to copy_to_user() after they are subject to bounds checks.

Use array_index_nospec() after the bounds checks to clamp these values
for speculative execution.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com
[Minor context change fixed]
Signed-off-by: Cliff Liu <donghua.liu@windriver.com>
Signed-off-by: He Zhe <Zhe.He@windriver.com>
---
Verified the powerpc build test.
---
 arch/powerpc/kernel/rtas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 46b9476d7582..dc294c95da21 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/lockdep.h>
 #include <linux/memblock.h>
+#include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/reboot.h>
@@ -1839,6 +1840,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	    || nargs + nret > ARRAY_SIZE(args.args))
 		return -EINVAL;
 
+	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
+	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);
+
 	/* Copy in args. */
 	if (copy_from_user(args.args, uargs->args,
 			   nargs * sizeof(rtas_arg_t)) != 0)
-- 
2.34.1


