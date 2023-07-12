Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB4751389
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 00:29:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=QCpzlNKm;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wRIoFa6f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1XVM4p1Pz3cQg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 08:29:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=QCpzlNKm;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wRIoFa6f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NCd0DN8z3bw2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:16:27 +1000 (AEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEj3mb000623;
	Wed, 12 Jul 2023 16:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=d1CQ5cg+ymWg4de690FM4E+Rdcfq30KZz/XnPiCYHJM=;
 b=QCpzlNKmCSe0HIB2WWIZXjzSorZdFaO1a0Zk3RDa2Fa5c7pvypYD5UBTSoWn62N4I2uJ
 b+5txqXgRXZ8HIGHI1JwGiICNDWTOsxMe1u2lYse+edwuMSG+YbT8AL0Q2tE6sHCtUjW
 W2ZF2V0NdtMUIGX0xInNofCclsjFD/KBiIg7JSNxQ5WiVczssIHWYY6FuHor+rTgV6e2
 BZSYpdaMXFalhtVxLDO4J5qp+ZdePAC895d6OA8eR8F6ISpVMaXzU3tkusNYjYJMRCTI
 BIRUd2iqTagTjjbW/wp/CxhKJhT6//JyXzOMxWTGKgZ9JzrMOdDnX8ZyHuMIyB/xX/hA TQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rr5h169sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:01 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36CEpYLc007131;
	Wed, 12 Jul 2023 16:16:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rpx86u2pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jul 2023 16:16:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XamKiN7LKqn0O5FN7IpArcFXxZVa3L+Y5SdO1W055HH91BdMYebzAi8MTedU8F6mJR3waRa5n6Jrh/JRvcGGejfgqiIndMXh9RJdLeUzif5xnK2LglWeNjTR/mRf1Wy+Xb+GOBzn6yvLzjCe0R/qDDMz9BbvesZw/73WL//ceLlsybiAXkQPaqpBQRG7RqoY/xjZXOmWdARj+ABwKkys+3OLGEyyl3U5qcv+rj8B2FHA823VMM4Ytxlv2riB4lr4q48Ml9JqEszF0sPVACE+46vuJ0cm+Tm6o7T6Uu+EQ0SHJYCVD70tcC7HPAjvxuKx48A8TTKd4PjRqMivDDl3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1CQ5cg+ymWg4de690FM4E+Rdcfq30KZz/XnPiCYHJM=;
 b=HSOWL3CleaaXiirFaIFcsCQP7SSqpaRKcVapKKhszApwGNONaeTtGDLkOdM/0vDPuzQnCPtPt/bc2H4rCdlFfmGkaX5HFLxF2LZPsn+Y57ZPfCkqPGYuJB3cQLe5kvUzLUPLLGGu2/JX4+Zm2rWEWGX/YqMMJunuucOlOXGMImTm0rzL6qcfFc/vRF5CoEvzeu7Ip7ezekUOKP/K3uWPrgdpNI9ry52dEpdMI9ZVBagVZRv2bgdSq4DMGAqsXJZfNxavX3ix7x+3nED9XJM5viJmLu0MaZVAQZ8KecsTUiNuAHNfUsm9BUHHB+3VRe6OcO4KdSJRjqekWteQmckUeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1CQ5cg+ymWg4de690FM4E+Rdcfq30KZz/XnPiCYHJM=;
 b=wRIoFa6fv69PZLkmja0Dhi0vz8A3gmFOMRhDLmRPhutWQ/O6N9O15+ME1VF1eVTzMIXP/H+IiucC+XF8S8TLvDozE3iEyxotzqhsebIYx3ryDMBWuefrlMiXjDwTCmDMZOZ+YQP7q9eM5qNeyMulIiz2gKXooRzqrH5GJvLjq2w=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM6PR10MB4219.namprd10.prod.outlook.com (2603:10b6:5:216::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Wed, 12 Jul
 2023 16:15:57 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::4c83:52fa:a398:11a8%3]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 16:15:57 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@HansenPartnership.com, deller@gmx.de,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: [PATCH v6 01/14] kexec: consolidate kexec and crash options into kernel/Kconfig.kexec
Date: Wed, 12 Jul 2023 12:15:32 -0400
Message-Id: <20230712161545.87870-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230712161545.87870-1-eric.devolder@oracle.com>
References: <20230712161545.87870-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:4:ad::34) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM6PR10MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: db3bab6e-658a-4cb5-8638-08db82f34624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tiG14fsYzy5MUY0AaHELkuQI87ZFEMTfxSyt5mEm7yG/Joj/o73E5Dik8ycoSxIapJJMVFfrVDcfYn3p9/XDr8J+lfH69rwguJO0yWya01Hx54f0De/w7/+e+H27P3mCiZ5HDr+uOLtVo4XSRa17eGe97kLkad4QT7lwHs/8DnL1aHBaQcNAsfXc6HSsJSydhn/wycwYixQ4gnKjm4UAp7TuhvL2M8Di/eSZmzQ53kdqFv3PcAV7HABfd+LUDdfQ9A4R7iy960xXgsmjnJoWdSsp55OoTxecO9AiLlYSAW/zVaxbPWSeKwoo05qLjmYotIuUddD1g/fNOM0shTWVlK0a/+V/jWe7WzBIy6G3WLDdwzuovFntWYcYojmhXkYeHF4z7rfDtK1fuN9S0nQi5D/LsZuJy7Ua9jms2vZfArDG0poF0FICd3jQUiguViF6v8OTEQI9DLPIXI9gDhioajXcaRcGXF78b/KxU7zVIGzkL8nW/pKfXa8KvA8u7mwYLQanK/9CJIhTxeIHUD3ulLNCIjaaoTaJ3OPMn200s5pjlTCXxVVaNBW/ONLuvfBNtpGnrDrRNfTPwPDC810G0LO1mYTC3+FPHFekT+wjLf8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(478600001)(6666004)(4326008)(6486002)(66946007)(66556008)(66476007)(316002)(41300700001)(921005)(186003)(2616005)(2906002)(7416002)(7406005)(7366002)(8676002)(38100700002)(8936002)(1076003)(26005)(36756003)(6512007)(5660300002)(6506007)(107886003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tk5gnCKLziveA/IHD4nYUZ04jvUVy0MmU0tUL7i7rMOMKvuY3CCUUrkZUQgY?=
 =?us-ascii?Q?N0WvgiKWW15yedbIC1tqIfmNb2MxL/+RINLxfMBrsBcPupJdQEPAoW5qGDvI?=
 =?us-ascii?Q?AxnwzIrcNWw8Tt0r7FDSnlOrFbV0OcLET9vlg531MCWmMaoAP4bJiXA0t2Ko?=
 =?us-ascii?Q?RAnEEcpm0fS1gcybncoQAfOW8QzpiPbm0o127bGLXebDxor4NJuL30VmTFDh?=
 =?us-ascii?Q?iOYH/nGEgCFcETo3xrn3DrJT07rIhaoJRzEmt9X4LoPMkhPIhFJtIpn3oBDH?=
 =?us-ascii?Q?q3fAGL4uHEsd1grrGrhWjlDLxGsQ+zzNrnsyzD+jCDO0hrwaJgSXD6/KkM4L?=
 =?us-ascii?Q?sqkMYTVf9NBFcVSQ7nd7rFpRUn5M/vCfppR5QvA8v5KPKgJ/ICWxLHqCcXsv?=
 =?us-ascii?Q?Ud2pFGhqU/DcvsK/5re1VMki13EJlyOSTkCV6USdatL8gcl1XHgTSU+37xd1?=
 =?us-ascii?Q?C5B/7/LZNQMmWDYhiRJ/s3BicqfTvh/GD+Faljkf4eiVm7lxYC/4lvpeCKUX?=
 =?us-ascii?Q?eVZDpoMOd4XXQdvX33A0rmsZS+YT5SQKfvBhQJnufQXBD3ver2UH8SC29iuE?=
 =?us-ascii?Q?S+JAn6Bl9WsFBtbUnBorgD92z0oAT6ODMM/45Gacxo+9uLQqnFHQ+5vzULwf?=
 =?us-ascii?Q?y7s76WBwfzQ3YUPACuaxHAKtbBq0mBmSF0u/i2Sz2r8tr5lFhWh7TjzJVdn1?=
 =?us-ascii?Q?+BOQ5gsmUZgb13Zw+C4btFzw2u1qav9VlFQh1bxWJkt54HtYfeegEPZfwSht?=
 =?us-ascii?Q?SSFsXBYTP2wOtqt5us/OY1cxd7dSf3HXOLJ2HaPDMCj0JQ0NjjXx1dzyTXlL?=
 =?us-ascii?Q?BZNRUxqAsGHJ2AqKlme/It1+rqMeMMVu1aybydaigDdFjHXjXMqUNSBNV0e2?=
 =?us-ascii?Q?Wx2CWDonU8VZRAt/oUOBTqGTkl6dPb8QHiibRM18RO9S5Grhju4ghyvZ8pGP?=
 =?us-ascii?Q?u5Gbe+v95Gi/PLF08RvBMTyt7aoOAnC+itwnmw1FAcN+5e74bxC7MRpjpJEw?=
 =?us-ascii?Q?ghQXlY8UySUZ6TY068WBvx6jK3UHAtKwJqvfBYH8ade5FVJ6hkQ86kVyB1Br?=
 =?us-ascii?Q?aGrQHVXUduAB9tW80z9ofUP6Pp/zK8Bsf1RkFbMRrAz8TF0tprb0PUZSQgWZ?=
 =?us-ascii?Q?vQ7qUyphCZHPRXRdcxupJqMOsTVM2AE9ERCAY4rcZ7+k2lBzHQTg/UZAD0Op?=
 =?us-ascii?Q?ZnQeCWga8iSdPRQOPcvfBLOItv5CxD8p7hI0JcV4luurs2211SP04QwPCOEr?=
 =?us-ascii?Q?IAIMYeiVGzboJeXC67Logk/SEWYk+CQj0dZlduQqfAQpnazVqtC+dOYzijOG?=
 =?us-ascii?Q?dLIcVR7+Oq9QyAzC4IwmPjoB4ZGYgQGrGF5q7Ck0Igc68/z07TCcvjhw7Br4?=
 =?us-ascii?Q?IF1q5O8ZzHxNH5bBaSoxPsgxW0L9L0lk2JOhWHGJqIUfUhyrKOh/XK2Ns5Qs?=
 =?us-ascii?Q?6UgNWB5a6R7AOxTuXOy0/n6yqSufnI4emnPi39VaGt1euQ0Kt3mPTK5RsBrB?=
 =?us-ascii?Q?FphCKvHdY+Kqn0pGKkxHgw6CJ6iF+Kwk3ni8XKXkkM6Qp2I0JxNXwPETnVmk?=
 =?us-ascii?Q?zdvnp+FkwVeDMUZO6LmHHcRzkTTuvjaJhaeSoP3oMJKSdg1kd2T+nW9kUm6t?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?gnlw3hiKxl3mHh1CZ7/0lu18eP7cvdo49drY/7X0CV2PeDywCyVjWxJSv0q5?=
 =?us-ascii?Q?MvA94VExbL8JF0v+/s5zjpb/EryBuK6bBajuvsjr0xCw+NGVYdP657GysNyf?=
 =?us-ascii?Q?OxoQgLTaV6rNEldqAsiXKbn0mK2o0ZTWdaGWQl9PYLFUM4Wk6iAkhhX7BDeB?=
 =?us-ascii?Q?Gn46z2M0S/eo3WCOHllNqVwyT7DJD+g3uJQqAb88Ofc7GN1kFmagf8ENPzl4?=
 =?us-ascii?Q?ed8Wa0eXn56VVp7RAW49SqxuXtbXAyHTLuoov1eRja6ELyey+ob32vrqUBff?=
 =?us-ascii?Q?HWV4PGZm1kqQWKVpBQNfT+37tKy4YXSHXw1F5Ryr+0tGccaCJlTR6gttRRVq?=
 =?us-ascii?Q?+BKKksWaXeHf4byzY2xq1EqobHLlCSRghsSm3UBsFg5LTD58z276tsNN8FB5?=
 =?us-ascii?Q?Vp6Ar2PQhH4DT6DO82X95f3O7z87loiax/VsDJyeTFsETsWf0JoHpS/+cEfZ?=
 =?us-ascii?Q?0i6xQZ1VFzd5UKqI+qdzpMTUAMrpsXOuX5SRnMjtG2h/iGQeSe8ajWQ2IhDp?=
 =?us-ascii?Q?Sb38OQl8UxshZqpKyqZNzp+YN98hqDOR/VIEdoCzL12zBOJqTbBgbnE526fc?=
 =?us-ascii?Q?7+iUFtAq5qN7dRT8ScNoRxZ2gOSlLFJS8qPYMoVgRa9G4Y5wzvZcOiJqPdqO?=
 =?us-ascii?Q?neal3AjFQvCzbe6ZkrEjFcf9wnYFCuO76YPtZJ/RJbOaK93Q1yxE2KYICgqi?=
 =?us-ascii?Q?gqVm5kigS2fMxB28hYbXYj5QpxBK+XHTRGwevdO6mRdt32OkdgyTLf3kNZk8?=
 =?us-ascii?Q?Dmb5UIeJhSXg3ykRXYMdeznaDT0eeuiV1BbQdAS1a6GrS4avVgeMr4TWG+0G?=
 =?us-ascii?Q?WrOFIsyDTq0CtXNbXvPT5Ho8UeElOcBRQE4JQyNX2Js9j5EqTvrNhXbOUdCB?=
 =?us-ascii?Q?Iqy1JURRXMLTpKIvlgvkTTf9wv9p9ABwOXpBs7UloNo3Fik0BsVrHt8Fv2fI?=
 =?us-ascii?Q?yMORwCzRAWijdUFdoXEvYuM+tY5e9VZabfdSSUSEjn2shu6ND7E/tFOJZan3?=
 =?us-ascii?Q?whNFNLp+Dlx8BVGpgtD0kqrkcLGGIRhwLXrQwmwl9/aWnoL+hUdNzAb6GJ6b?=
 =?us-ascii?Q?cm9wPoaFxKBDx5is75p0yWJLc2Co4pboWBlJa2eu2jDRB33AZ3xEXef6rzuI?=
 =?us-ascii?Q?3TgttCYGy3njZY520qEofRn9IpQq8I0hkJpAUgvFajvheeY8gr+sEP+Lbgca?=
 =?us-ascii?Q?j/ofpVXRWfj6tkGxZyId0+UPbOe4TfW1gMV3rDUlsoQf3EDIUgSj4f+JPCtD?=
 =?us-ascii?Q?1LAUCo5MJICMgbghAdKubSpnO++WDkprpj1I/1Y8pMU/nxjniJ1NhssZfVmb?=
 =?us-ascii?Q?eyFkv4NOjcrH1/PVzZzHmSoZPxrdXfQAiiN1CaPpsO881qbvv4aLYxxmAp13?=
 =?us-ascii?Q?elyjD4oqpVF1ztHG9HnRzVLOUXYEalrYcS4D4b4FKMWi3VgwmMhIZN1DM2Tr?=
 =?us-ascii?Q?bNozqyJc/G0qe8GSUgCFMo+l84//yvVopLwksfcPkPWCuswZWw1h9WhF1EtW?=
 =?us-ascii?Q?8ykRt5ZqxyB5scJaMAA3qIJoXkZGyLGARLQ3tA3bQ7jtHy4xX+KxiWypcnIQ?=
 =?us-ascii?Q?cfIstRecEr1IFCTcBXy3RuRZlgXD2+JhaKl1GgXL3KBo5DnQF6DBZGxfjcWq?=
 =?us-ascii?Q?uz0nPP8l1p8x5ENp7SdRXdaaXu4cfi+BFoSATFmTNVmtwZCYDSohKMhx/UiQ?=
 =?us-ascii?Q?b6bYo0QXSZSXpcOhuCRu8GpHOLjCV1wXF93O7Nh4ZmwKnwU1o/gnfbVsUdED?=
 =?us-ascii?Q?hIbEHhGh6jOmD4QZoeLwK9WkA1/nezIKUnkP5RVnXJ/Yyx8JBXTbuCgtsZzH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	h8J5mnPbUNuNP4lSYUS0qjVzl0YgQmmVWNZMV6ebs5MjXYgU8BlSPTWjddKw8gbJLqeaUVvJEk76hF7fGPgf4c7r2Z2E6Q16FUZT7HI3YVH9WW4JK5Yj25ohVY5GA5FTRMuDIGE0bYTid8pB7zVIkDvEQ7LoZl9AcqhMWuCV6+7EAM8emhSOft3GWYuZP+1NMXHjs1HL8+adyHfewFi8MOGL3HOB+qTHlO6GmVH/iN31dFh1bIfu9C6RqDlYC/WrWXcY1s5j/fnM4y81oDj1gYDUdUikzeefVZguGfxPryHtc7F7QyeA9RCHxTvAA2IiAsljaVSeFbUpfrhbXXSuqDKvABAfR2hSPI8UUy/Q9FKW/hJu+x3U2dyEY36aypwxF8erxDo4I0EwAAzCJ6JXqe2pqhZqL/GbhHtaqINe85AdoLym02xzuQWOdOsD9bCNxbgwaXtONdrx8g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3bab6e-658a-4cb5-8638-08db82f34624
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 16:15:57.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtkS5oLYWsAOZbxpLS9GU2anmV1+Rim8ruHYiFH0R8n7PBS2chQ7tte1ZSZkxsQGUYuKxfY6V0Np1JUZxCOhWNymlF0wwT1p72+o81Vo22A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_11,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120146
X-Proofpoint-ORIG-GUID: TKXQeYQZuHU-HL5-mhHqVIXB7DwLmTeV
X-Proofpoint-GUID: TKXQeYQZuHU-HL5-mhHqVIXB7DwLmTeV
X-Mailman-Approved-At: Thu, 13 Jul 2023 08:26:22 +1000
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
Cc: peterz@infradead.org, linus.walleij@linaro.org, thunder.leizhen@huawei.com, hpa@zytor.com, kernel@xen0n.name, eric.devolder@oracle.com, ardb@kernel.org, tsi@tuyoix.net, agordeev@linux.ibm.com, paulmck@kernel.org, bhe@redhat.com, masahiroy@kernel.org, konrad.wilk@oracle.com, sebastian.reichel@collabora.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, paul.walmsley@sifive.com, boris.ostrovsky@oracle.com, ziy@nvidia.com, hbathini@linux.ibm.com, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The config options for kexec and crash features are consolidated
into new file kernel/Kconfig.kexec. Under the "General Setup" submenu
is a new submenu "Kexec and crash handling". All the kexec and
crash options that were once in the arch-dependent submenu "Processor
type and features" are now consolidated in the new submenu.

The following options are impacted:

 - KEXEC
 - KEXEC_FILE
 - KEXEC_SIG
 - KEXEC_SIG_FORCE
 - KEXEC_BZIMAGE_VERIFY_SIG
 - KEXEC_JUMP
 - CRASH_DUMP

The three main options are KEXEC, KEXEC_FILE and CRASH_DUMP.

Architectures specify support of certain KEXEC and CRASH features with
similarly named new ARCH_SUPPORTS_<option> config options.

Architectures can utilize the new ARCH_SELECTS_<option> config
options to specify additional components when <option> is enabled.

To summarize, the ARCH_SUPPORTS_<option> permits the <option> to be
enabled, and the ARCH_SELECTS_<option> handles side effects (ie.
select statements).

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/Kconfig         |  13 -----
 init/Kconfig         |   2 +
 kernel/Kconfig.kexec | 116 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 13 deletions(-)
 create mode 100644 kernel/Kconfig.kexec

diff --git a/arch/Kconfig b/arch/Kconfig
index aff2746c8af2..b2872e9d3760 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -11,19 +11,6 @@ source "arch/$(SRCARCH)/Kconfig"
 
 menu "General architecture-dependent options"
 
-config CRASH_CORE
-	bool
-
-config KEXEC_CORE
-	select CRASH_CORE
-	bool
-
-config KEXEC_ELF
-	bool
-
-config HAVE_IMA_KEXEC
-	bool
-
 config ARCH_HAS_SUBPAGE_FAULTS
 	bool
 	help
diff --git a/init/Kconfig b/init/Kconfig
index f7f65af4ee12..639e8a3363c3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1927,6 +1927,8 @@ config BINDGEN_VERSION_TEXT
 config TRACEPOINTS
 	bool
 
+source "kernel/Kconfig.kexec"
+
 endmenu		# General setup
 
 source "arch/Kconfig"
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
new file mode 100644
index 000000000000..ff72e45cfaef
--- /dev/null
+++ b/kernel/Kconfig.kexec
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "Kexec and crash features"
+
+config CRASH_CORE
+	bool
+
+config KEXEC_CORE
+	select CRASH_CORE
+	bool
+
+config KEXEC_ELF
+	bool
+
+config HAVE_IMA_KEXEC
+	bool
+
+config KEXEC
+	bool "Enable kexec system call"
+	default ARCH_DEFAULT_KEXEC
+	depends on ARCH_SUPPORTS_KEXEC
+	select KEXEC_CORE
+	help
+	  kexec is a system call that implements the ability to shutdown your
+	  current kernel, and to start another kernel. It is like a reboot
+	  but it is independent of the system firmware. And like a reboot
+	  you can start any kernel with it, not just Linux.
+
+	  The name comes from the similarity to the exec system call.
+
+	  It is an ongoing process to be certain the hardware in a machine
+	  is properly shutdown, so do not be surprised if this code does not
+	  initially work for you. As of this writing the exact hardware
+	  interface is strongly in flux, so no good recommendation can be
+	  made.
+
+config KEXEC_FILE
+	bool "Enable kexec file based system call"
+	depends on ARCH_SUPPORTS_KEXEC_FILE
+	select KEXEC_CORE
+	help
+	  This is new version of kexec system call. This system call is
+	  file based and takes file descriptors as system call argument
+	  for kernel and initramfs as opposed to list of segments as
+	  accepted by kexec system call.
+
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on ARCH_SUPPORTS_KEXEC_SIG
+	depends on KEXEC_FILE
+	help
+	  This option makes the kexec_file_load() syscall check for a valid
+	  signature of the kernel image. The image can still be loaded without
+	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
+	  there's a signature that we can check, then it must be valid.
+
+	  In addition to this option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
+config KEXEC_SIG_FORCE
+	bool "Require a valid signature in kexec_file_load() syscall"
+	depends on ARCH_SUPPORTS_KEXEC_SIG_FORCE
+	depends on KEXEC_SIG
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+config KEXEC_IMAGE_VERIFY_SIG
+	bool "Enable Image signature verification support (ARM)"
+	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	depends on ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on EFI && SIGNED_PE_FILE_VERIFICATION
+	help
+	  Enable Image signature verification support.
+
+config KEXEC_BZIMAGE_VERIFY_SIG
+	bool "Enable bzImage signature verification support"
+	depends on ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
+	depends on KEXEC_SIG
+	depends on SIGNED_PE_FILE_VERIFICATION
+	select SYSTEM_TRUSTED_KEYRING
+	help
+	  Enable bzImage signature verification support.
+
+config KEXEC_JUMP
+	bool "kexec jump"
+	depends on ARCH_SUPPORTS_KEXEC_JUMP
+	depends on KEXEC && HIBERNATION
+	help
+	  Jump between original kernel and kexeced kernel and invoke
+	  code in physical address mode via KEXEC
+
+config CRASH_DUMP
+	bool "kernel crash dumps"
+	depends on ARCH_SUPPORTS_CRASH_DUMP
+	depends on ARCH_SUPPORTS_KEXEC
+	select CRASH_CORE
+	select KEXEC_CORE
+	select KEXEC
+	help
+	  Generate crash dump after being started by kexec.
+	  This should be normally only set in special crash dump kernels
+	  which are loaded in the main kernel with kexec-tools into
+	  a specially reserved region and then later executed after
+	  a crash by kdump/kexec. The crash dump kernel must be compiled
+	  to a memory address not used by the main kernel or BIOS using
+	  PHYSICAL_START, or it must be built as a relocatable image
+	  (CONFIG_RELOCATABLE=y).
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
+
+	  For s390, this option also enables zfcpdump.
+	  See also <file:Documentation/s390/zfcpdump.rst>
+
+endmenu
-- 
2.31.1

