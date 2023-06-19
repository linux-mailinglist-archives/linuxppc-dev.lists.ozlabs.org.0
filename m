Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA65E736015
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:20:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=kNE+VjYI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=cPMBRgho;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlQjF52zjz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:20:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=kNE+VjYI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=cPMBRgho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=eric.devolder@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlCb64ydJz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:59:14 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J9nGTv004107;
	Mon, 19 Jun 2023 14:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=u2NI100u2alkXMbO4/NzkFor0ha3sl13nz89+TbUZD8=;
 b=kNE+VjYI11hXmHKZkSsuT2CLmDR3Xgx+8cgZQY0o6L13pph1Ru7icBsp2YiBTADmqxR6
 myg/Xtg3JI8HIXDvFSuSntEiXCFYPsCJSON6IMtsk7N7a7q0i9J4V7hdwkzE+jvGaToV
 27INEr2wyvurosPLl2hCjFSRi4t9J2RQR6lJVXawClcbyEKzbgzIv/we16aUmp85XyId
 KFEJD1lyLXCan0hEd9E3xG/RnMd//V0h2trCKJBOpMnoK0VAENm8ERRf9bNrrtXnY5wE
 LVhKO7qGL22V6XOknwPVdsCd8oU4lvK71f9/7YL+2cgNOMySwkxvOLIEs60Equ+feqKd Fg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94etjvm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:57 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35JEXvUI008354;
	Mon, 19 Jun 2023 14:58:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9393spd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 14:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC8FwG0PmNzodOx6458yvL1rmlinVS15I2For2vpZtWUNwxZpZMJwLzH3G5Ts5dp2S164WTWLejBwwyLckUvdFE85S4vStaxEJTrm3cMVcAJ/u0Qn+iapucluphby0jMRqU5QSUKMgQhGcuYkDrtufwhI7PqniV4sFZfqm0HMZl35vEH/+x4vFP5bjq4Ii8Qr4XZTyLvsiDhj0qDnQr/nkTL69W+oEv135SSEPwq0a7oDG57P4w9XyFzZJd/3hkJps5oOCrKsko8keS9gzdKRpeuI2DMpZT1FCE1/Bc58O0WMoVlQRoScDny1xh/mNtI5JchInQo02f7Jm1L/48sFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2NI100u2alkXMbO4/NzkFor0ha3sl13nz89+TbUZD8=;
 b=D6Ak4s3Bm4pxK71iFzRFkxlT5jPYn3pbG+gSQLUYERgHIN8uMmRMbu6EVOZU4CAnGsrWhdTPlI7AnGxhpJTGfmEkTvn5FIBPy1YbadChsw9GKZj9KrRh9R1cD8a8PgeuDPB9PzOs4AKu/Zza4ul6kf1sN5W2Xqk3f/xT9q+T12PeMLKqnpui7S2GayB0R5THu2G5iiQqQmvAYsblBeWfsqb8WUyBCms90TYaHJiqGZ+MLadutBfD7P+2cDLYiS35+/7sTAa9POsSoHi6Qv5p5ax2H6NCHBGic7bZdB4+hfHGvw8FPnCIe2gxOXmS/G/Es+wZz7aTbF2GPjAoIcu73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2NI100u2alkXMbO4/NzkFor0ha3sl13nz89+TbUZD8=;
 b=cPMBRghosqmSEiEiZYXYQpK3IyLZNUAEmeJpz6NwFScHrQTSSle29ml3jjx3mOzfF4EbInV4fOOno2jMqwYAwPWT6oRTKnJtkGLhbUJh4iN/bggbQyqqRqJORhb+43A25Jow87fELZOYtI1aAJzL8ppRQf/T+6WRC+C3FGf99zE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM4PR10MB7426.namprd10.prod.outlook.com (2603:10b6:8:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 14:58:23 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 14:58:19 +0000
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
Subject: [PATCH v2 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
Date: Mon, 19 Jun 2023 10:57:51 -0400
Message-Id: <20230619145801.1064716-4-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230619145801.1064716-1-eric.devolder@oracle.com>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::35) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|DM4PR10MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5df6db-2e67-4f12-793f-08db70d59e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4gPHt0UI8NMVCVGNoJOGU6qOgEzJ0NPjL10wP/oBLEIg67KRGh07/X7MTReOQlH99hUZcSLndt9zVv5upNpkLbR/cgrvRTUMQxFrnLH8rDSEU5Ew7ee7lQIc+bylOHTDWRfDMVYkhlRlzYi6H7lWDAWrF4fzFsRYX96TFC1Gb46mXSad7D9Aj0WAyoIuFTnHRM1nOpeVl1eyL7BUbyH0ub07QkHzIdx/TYWm9LcreRERytoSFzukN1BavGxRvI4zL+qjRuthwUMydoajeZSkU9FYff7e9UvJQGNUDZ1bI1WohUQFNiVaJnR/7+xIwEtSqittVjhnK+jCeMSqXf9veFr9iubY+Xp1pKfvP9VfTORUZJ8XA5Y0en4ZRwfDs5a7ls1YrOfWoxWsntdalKS12hWa7dSKEaWi9tdSKCPrhkd0Cuu+jSNYtpmfqkURRzTgDEQ7HR3glcDhvBfqOQNMTJixUqOtuV2Nrk83FU8h9FD8hzAGdP7repsvtQ2JoUGz0uNXna4+k87lk7gr4K9lVotjVA9E92CB8OaHCB20fLLp4e31zo/0EGlSUzoZnaV7Irdk8JbWNS053pvAxV7WGWYPeC3IV8dAloDfCgIsRnQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(186003)(478600001)(6666004)(6486002)(86362001)(26005)(1076003)(6506007)(6512007)(107886003)(2616005)(38100700002)(316002)(83380400001)(66946007)(66556008)(66476007)(4326008)(921005)(8676002)(8936002)(7416002)(5660300002)(7366002)(7406005)(2906002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?AZDe5IXgqZyQirKqLb2ljbsmEiIu6TSSJS6q0gKxswkerbfwQTKW25tyjSgm?=
 =?us-ascii?Q?HYdwwoicJkloUogWm2gIANobKG32ySayAiVQAAw7q9K1Ldg1woU4+wINOjXh?=
 =?us-ascii?Q?1+85u4354bRi1EZHD9/ag/AOyNFoeIUFeF2HrM8qHH4yc+ESfTmbC0Xaq8IS?=
 =?us-ascii?Q?eAvgNWUMbU64OQjD9NHLrGIbhcrQrHTBdu/PTJr/eLYZbF4WkhAvEUMEYbFd?=
 =?us-ascii?Q?wz+V/YvuBS9TjUteuOyDI+2i0tsKSys3dlr+2DZKjNHSn/nF2Hg8+4sVOwYE?=
 =?us-ascii?Q?hHWhOG1MIp1LGHknnpkhig01/9ohmy2rq8uQJnHloTjVmChvPb1ZogQ0c2Io?=
 =?us-ascii?Q?f+nOHE8HBfQA9zHhTi30313VHk3wpaMtXrRyo48KZwOozbNwOzDk9EW/LV1g?=
 =?us-ascii?Q?amFOz9OBqRPRcCeR8trsYlV67EjxkkfTDO3C0CmK1DiZX/+/eEzxaWzZU2Fn?=
 =?us-ascii?Q?jBHqd/iKK4/uDEbdpE3wO6LazBU65xHv1cmmqSnA9Rfq3YHft3PMaHrjRdCb?=
 =?us-ascii?Q?lr7zA+LpdxyBpHYHPB4c4DjRUv/gBmsB9sqb25IB3r/VdvjcdhaZCyvK2n9a?=
 =?us-ascii?Q?NdqMLfD7FIWsWZKwPMorghnLHpDok7NbAZaCAfvoAzQnzg7cQqfjwGWa/Z8K?=
 =?us-ascii?Q?KBL6MrgvikKma3wG6MlQY0BGaJtix69Qz7a4NRuXxDUNClVgko5iBJcxdwlS?=
 =?us-ascii?Q?88Rtsc5EQrDfQvcSlD5MVf4CRsTjoc0jM1AtePp8XSfOKmwMdBDk/LYicIoX?=
 =?us-ascii?Q?9XuPezOKhtTD50S3wnGPBlBn3qOF84rZlUqBxxZRhoWYu8xtul7B+puYjvvh?=
 =?us-ascii?Q?MT8gKyqyclYyWWQWHqY+JAIcMsrJMA5sfuEt3cR/QL4OxzY/+4VloRqeOUzx?=
 =?us-ascii?Q?/ZAVlrKYcxHeeRIPJ+UVQhJBjSyr2Yi15M92/e8pXTnZlhGnmmduJfW6I7UE?=
 =?us-ascii?Q?N5u/DZEk2PO/CtoHfvSSI3cwbTkQpljAhuV+UuFz2YSt6od8EIOLPnIL+3g6?=
 =?us-ascii?Q?7KCMyhrOKpD9lSLvkwgkZh0JkkCpELqGxAAKnglvla8aRr4lLwAz8f17uF2g?=
 =?us-ascii?Q?6luYfi6oxnHJzq0UUPNROrYUD62SB2itsB4v8O6gLoscksH5KSIgWpdT4ouC?=
 =?us-ascii?Q?BsfT5WLbfyEK7POu782RzokEE9sSEbMoVkznW1aAOhQ3sIGltMj71Dfx+Ex6?=
 =?us-ascii?Q?cqCCKSCuu96jyVQFNPIdyCUknUAVbPtGLAQ9xkz7eTwQOfYthYPzx8bR4/cx?=
 =?us-ascii?Q?XQJpQnusHrlvFAhTziCo9cri5c8Q+/kA5+nIPym879msaDHgUELLXLwGvd7i?=
 =?us-ascii?Q?vem0JfqZPRBm7nk5kKTAHT+fzJwVk/mmO74W/MG/WhHBbi9YKMIo9YxTWVhH?=
 =?us-ascii?Q?mp+mjt2jviMqrCB/plnpZZ6E7+rodyI1c7OsYOs5HZH0iKEouRechIIonepT?=
 =?us-ascii?Q?xGh8mjIM4o6XivMIB2nZF+ROA517XbnqusP6nIFMUIcIMbV8wqLehf7JDFdO?=
 =?us-ascii?Q?1BSEURd7/u/A59QfY0S+u5OzphtmkqwhIJWOmD7Y8RZBnzTyGUzpdE6+W7qZ?=
 =?us-ascii?Q?AVRbU/rLC3c5+EgYXLBSYd2LpkBIePTgysVYBA05re6ttDPpmc3yzvOYhsau?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?j7VPWr5RtFH6lt78vVJaRPZnejZLYKB3QNRj4y5sjH0Oviutet4lEyTqGzAu?=
 =?us-ascii?Q?QSNXlnrmg2alCWihmYfo5OrEOAND7VL4pZMe6RyfrR5lKngJdNQxvRgihXke?=
 =?us-ascii?Q?R2MkRlGaleCHLjZs0dPZZLm1WY7XT2XXKTzvYraBxMWtYSg/lpY6vG3SLAjM?=
 =?us-ascii?Q?jWV3kHIeOHujhMjHL3D9ZI1D3g9R9z8jLOZdoz0VU1CVfQSfjNcaohMaVmg2?=
 =?us-ascii?Q?HgGGDlaQDM+nUVSzHSKfr/8X3uIN7z2DTIG3Ec80QYDdGHt3fi3K4DpLmnQL?=
 =?us-ascii?Q?F/5IhtDOsuuMc4lPQ7wmOEagHQRPR93KDQ5DPG7MGYlSMECyIiXbONEd4lOt?=
 =?us-ascii?Q?7kNr4OJKOB6RD16FReOeqS9BMltvZnlOwsCyN1xco89rq6zTQUs6XvF9189y?=
 =?us-ascii?Q?IBn21T4d1N26jmPvL07ZWRNa/UCFUGHJrNN5mTK21BCThUbtgyqhcXk34fxI?=
 =?us-ascii?Q?aZqwNoCwsKS+fe5U/F4p+6hKsv1X7/5svvV3hsjpYOVGLM18IMU9PKnU5YAt?=
 =?us-ascii?Q?aU9e5yoRNXjjZowIGsoW+bllKj3+dskCwe7BgQJUpsZdho3ZEPLgxOfR4UZ2?=
 =?us-ascii?Q?SGRtjgH22J8KzhvQljWekdvuiMk0m5hQQPINoUPvYVBuEWOMrJcCT8xyj7he?=
 =?us-ascii?Q?fCIb6s5d6KPyZBUPgqD+OQ9iN0uqbdZiMj9/jHMa3tX0Dmfk0hmioaDteP73?=
 =?us-ascii?Q?UsPWX2Gtr/EAgwUNSfUQD1uGcdRxnrUhyRqoOpFZVNeHdKdpLJIua3VL9Dlu?=
 =?us-ascii?Q?ILD2CzR+cSOoiYCHeRE2Odax0I77x5MCB5Cu+1jI0ppJ0osxDP/umByN3+cc?=
 =?us-ascii?Q?3q/GEGD/5JH07QBga8WFMdPdJei9yk9bLAUlM39x/ILlA2ZJV3iVDmBMECNH?=
 =?us-ascii?Q?+QXk1iaxqWAsOPhcjGRhmKnsboY7n7alc4DBeqsS5X4aXIFicCcDP3A7xad/?=
 =?us-ascii?Q?F6JYhPhNZyFr1Qdzu7z9lY0SCsjWt4WaJ4Q6XoDKa5XVmb4HxYVUlslh4KJU?=
 =?us-ascii?Q?JKwBWNxotr5DZwYS+/VTZP91LLvVBUWKlIMHWcHTO+0H/d0EkonA2asaIrco?=
 =?us-ascii?Q?Xubs57RsSC28MSKhEnR5HRLD0Rpi+lbMeKBkwbx99YNC5hE2JxhDK1cnYOVS?=
 =?us-ascii?Q?9HuEg5lPlVu6HrbjhswuEHdyctu+8rrubCX46Bfy4vda7QcLYEQ75hYSMA4D?=
 =?us-ascii?Q?pkgWb3uhbwDEXabBXLThTU6Sd7qzPymVFwyZIkpNkUV9GAOgQdigMKghr9cW?=
 =?us-ascii?Q?YnsFfXbfxikx3srTqCNu4dIhxV7YKYWN1W1RblrUzmQ/iiG+VxhWvkaLShKN?=
 =?us-ascii?Q?c+i1Uzi4GtUEtkoPN3qDxXUoSTcd9Kzvv+79/u6x9TTGafFtnTmQXnInYyn6?=
 =?us-ascii?Q?z0F4HqDulQWklnchu3D0vlbcW8q/WPxtg8ZhmY826auQdAokMDebWRWsFE34?=
 =?us-ascii?Q?26pjB4IwqorZUQlqmcOxtolhV0aUzA+MQ30htU389+GI4ame3FCKtcNVNfWy?=
 =?us-ascii?Q?joqu1nUXeIRhIhNNAdiYLmefk5lheBE293Rkxaz4cc1jkMOHEvSBwxjra3p4?=
 =?us-ascii?Q?JY9jHVzsVzMqqpSLkffGRoCdgZcG/4DVUMl9eJlYCglvczBCSPeZ9lo/xc1C?=
 =?us-ascii?Q?VoqXSjmgpRWyECCcrlJqm7/sa/nuRBj7pVT6F2/Jr0fUkU1Oy8aTNr2zP8P5?=
 =?us-ascii?Q?HqWa9rufbX9S/HMfzcva8h6kKBxse7qESuZ7eFGqyCuDe8uUda5p4lRy0E3W?=
 =?us-ascii?Q?16dP5M/I2FAic39xXAa3M84QdU4I1vvCzHvujXcJlFGz2XV2Gywo0qHbQ+Lo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: 	zUPScj9Ab/4U+m2akbguRfmRbsoX78OmLTvb7NgYWOk1x5M5RYa9pPvKGvCaJ+T54FB8WTqiONucvmGiRHf8WgIqW8WaeeI2mZcxs71Xa/gR8lTYvvDOcBK5NJ8bsbQYc5zyy4mGBuF9E+UUbadKXcEWXg221s6AYAhSKqwRtJGohzk9gFgbGb6w5jfVH6dVPDXAvx/pNM+BC3EO0YaaIpabltg6aZ+eCOU9UTrzZQdLuMbZGbabpuBPgTas6MwH7Hw1KoD7g1D0WzwcLo8Qmyit5FFFFBkpk1MblPECKuiYUxomaHOreVAtIPl9MyFLDkQC0l411Qz2xuEWIDYo0EgI2KioYwXeK70xT1WCjW4/jAA3IlTmbdxXzXspJOGJoJUq3oLCwG9PFAy5LlutbI/wQratOvKbGaJ7PDbq0CY63VpXWgJGyRJhFygwFPVG/Yz3PQLUFHDVyw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5df6db-2e67-4f12-793f-08db70d59e88
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 14:58:19.4477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhjBslJCu7CtQDArXQ0WaTHWgsHwdncf/kP/UsFe3rP35SBLUBcJ2jy/erb2XyGXgroUtZhfduMP1xexpxf8MTrfSaO3x8lIzMHPKS7+wNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7426
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_11,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190137
X-Proofpoint-GUID: ZYRMfgP3SL_4oYFwoVl2ofpnlhqIF5fD
X-Proofpoint-ORIG-GUID: ZYRMfgP3SL_4oYFwoVl2ofpnlhqIF5fD
X-Mailman-Approved-At: Tue, 20 Jun 2023 09:11:26 +1000
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

The kexec and crash kernel options are provided in the common
kernel/Kconfig.kexec. Utilize the common options and provide
the ARCH_SUPPORTS_ and ARCH_SELECTS_ entries to recreate the
equivalent set of KEXEC and CRASH options.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/arm/Kconfig | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0fb4b218f665..6af0105407af 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1639,20 +1639,8 @@ config XIP_DEFLATED_DATA
 	  copied, saving some precious ROM space. A possible drawback is a
 	  slightly longer boot delay.
 
-config KEXEC
-	bool "Kexec system call (EXPERIMENTAL)"
-	depends on (!SMP || PM_SLEEP_SMP)
-	depends on MMU
-	select KEXEC_CORE
-	help
-	  kexec is a system call that implements the ability to shutdown your
-	  current kernel, and to start another kernel.  It is like a reboot
-	  but it is independent of the system firmware.   And like a reboot
-	  you can start any kernel with it, not just Linux.
-
-	  It is an ongoing process to be certain the hardware in a machine
-	  is properly shutdown, so do not be surprised if this code does not
-	  initially work for you.
+config ARCH_SUPPORTS_KEXEC
+	def_bool (!SMP || PM_SLEEP_SMP) && MMU
 
 config ATAGS_PROC
 	bool "Export atags in procfs"
@@ -1662,17 +1650,8 @@ config ATAGS_PROC
 	  Should the atags used to boot the kernel be exported in an "atags"
 	  file in procfs. Useful with kexec.
 
-config CRASH_DUMP
-	bool "Build kdump crash kernel (EXPERIMENTAL)"
-	help
-	  Generate crash dump after being started by kexec. This should
-	  be normally only set in special crash dump kernels which are
-	  loaded in the main kernel with kexec-tools into a specially
-	  reserved region and then later executed after a crash by
-	  kdump/kexec. The crash dump kernel must be compiled to a
-	  memory address not used by the main kernel
-
-	  For more details see Documentation/admin-guide/kdump/kdump.rst
+config ARCH_SUPPORTS_CRASH_DUMP
+	def_bool y
 
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
-- 
2.31.1

