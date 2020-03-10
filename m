Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621F17F5CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:12:23 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cC8k4cPMzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 22:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.83; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=gm8qSfRV; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60083.outbound.protection.outlook.com [40.107.6.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cC2C1pQgzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 22:06:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fijrPWT5EqLjAyd3EpaacCWAC/qOfm7KzQZl/IupA7VmrWj/DZyhc9nU+LzCeYRVrlM4QF1ZVMDcxP36OfOylcLZQ9kHN55ZIffsX2Z9w4Kpk2J4Pt74YL46lan7BPRqOzGNkUjqofUcm1R9mYH/At9UGxNKx54XXklgJPtpxgq9VNKd5BV5ei0Y77zTobbxx6B9DXlICFIkcvhAu6/OdG5f0PMGNI06+G1dp62JpWCCMQhURTd512oIufKwSxa8MfpkPH8rQBRa0OzhVBvnIblb6OcehO7VGaB2GUebknWeP4roD0k8DR7JrcvqyB7Ne6bmGJ1XCzhMCN5nwPSdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NJq7hLSukqSEUXVlFZmQsr64CT9Ou5mlVow3vxvnK4=;
 b=AS+PVmNqwEqEW8uJsXGP4dUiVVVMNnQ/qyG8WuAylsD0aerd/Bravhm0LS/vAyrSxTXegdS5aJFiPkXtfYHlEBx2A/hDXaYWgJ2+ilv3f/QTP6hJuWACu+tSZAPVv4T5JFO5sjaFxWt1MVlIK9G/fb6yBH5GkIPToSArM2pzI2LT8/7WQdITKtuab4UDCC9aXLdDM00h4OVnlO8n3mPimc3BtoY9iWLOblPBsIlZSC9Paz2mSVFNgj7rQ0wi9kEHtvnkM19hWUcK47l3yc1PQ6tx8tjNg018JTx4gWxCbi2DSmX3VsUAWwA7nIBGnRoKFGQUge/Yw+wj9/O0kEiMjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NJq7hLSukqSEUXVlFZmQsr64CT9Ou5mlVow3vxvnK4=;
 b=gm8qSfRVkhosM3A7FvuR69EdD97I966K0zwrqB0PpXeqAi2iUrNT3nI1h/3WalwRHB2HT7A2L9HRY2otyZQyL7O8iAWRDx6yCkwIyjrBTfyDN3lSXRxKwRI691ZV5QHiDNokCSO1u/0Th8dGWEZGhhr/BD3NQ3bV5QTX2wQUn24=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
Received: from AM6PR04MB5925.eurprd04.prod.outlook.com (20.179.2.147) by
 AM6PR04MB4152.eurprd04.prod.outlook.com (52.135.168.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 11:06:02 +0000
Received: from AM6PR04MB5925.eurprd04.prod.outlook.com
 ([fe80::fdd6:55d:c03e:5818]) by AM6PR04MB5925.eurprd04.prod.outlook.com
 ([fe80::fdd6:55d:c03e:5818%4]) with mapi id 15.20.2793.018; Tue, 10 Mar 2020
 11:06:02 +0000
Subject: Re: ppc32 panic on boot on linux-next
To: linuxppc-dev@lists.ozlabs.org
References: <CAKwvOdk=eFqRqN0KO1en9wH-NhcvwXbx_ntmUtf8h_xZSd-qKw@mail.gmail.com>
 <3702b680-a0fc-20dc-027b-518b880f9a41@c-s.fr>
 <c084a429-9ea1-7126-f057-8647a2e0dfac@c-s.fr>
 <875zfcked5.fsf@mpe.ellerman.id.au>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <fdea7934-639f-e183-bec0-ed31c4a929d8@nxp.com>
Date: Tue, 10 Mar 2020 13:06:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <875zfcked5.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::14) To AM6PR04MB5925.eurprd04.prod.outlook.com
 (2603:10a6:20b:ab::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.171.82.13] (89.37.124.34) by
 AM0PR10CA0034.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.16 via Frontend
 Transport; Tue, 10 Mar 2020 11:06:02 +0000
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55ed5b73-4f53-4019-8011-08d7c4e3056b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4152:
X-Microsoft-Antispam-PRVS: <AM6PR04MB4152F0FC6435922042F8C779ECFF0@AM6PR04MB4152.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 033857D0BD
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(2906002)(36756003)(53546011)(956004)(5660300002)(16576012)(52116002)(316002)(6486002)(44832011)(2616005)(478600001)(6916009)(966005)(8936002)(81156014)(31696002)(81166006)(26005)(66946007)(66556008)(31686004)(186003)(16526019)(86362001)(8676002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4152;
 H:AM6PR04MB5925.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0oY1I8rO1sgezarg72btIGcQxIQHNvdh/x2hSM5vwzRsggtGOnYashTs6PgS3+VFmgaceCprECFe4WwNcLtRygNqv/+lPhK9X9dmPCWfUzo87EKx4BgQcwfd14sCEoS16TLmHJudVMGo760xvzXEVI3+P2lyjxjqGIVj5VHgshDMb1cPsnfLStu3o9U6b8nQigbC+m3rbLhHdQ3FI2x4JMy6Gaqb4g45KO5u8JVkotZyMvIyecfx6pZIPVytKpqkKSZ6NckD0fjJOZdfjZY2B5erTEY45UABDrdcUlbE6fQBOwY0nRkDiEIrM1ss4cMH+X/kiz49ixgVuSl1GrE4akTv6yPgziXBHXxL0C5Z99O3JvdVSRR7DJFkjNB3euUB2VA6/sD6D+RtU4kYMr3ce16rY/VYyFSolKb4eOmtTkjmWIzKgkHOqMgLDVK877zjqTsCNPLOB3Ujeouem70IOcyWd3pu5uIA9KOUYFyqzqapnlMtDz/aukKWV1g3hWo//CXPnnLRNFTrs6YzA51Jjg==
X-MS-Exchange-AntiSpam-MessageData: z76/kW9MTkPTRCse+kcZVPoZItMXJCjrQFc83BYiNHV711q4J8TFHNhwarnWewHTecAE1GDdp6OZkVW/KpujT6C/5eHg5AayfZypbSioV9nKbeH1XgeQQDl3r1luourOG27DohS/5J6ql53Ba3EcMg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ed5b73-4f53-4019-8011-08d7c4e3056b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2020 11:06:02.5225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+yE+eY8Kd79hSYPIaj5PTcw1UgGIht24Q2aKzRIGjmMb1fdF/AGiXwXFqVLC2I61TvQM1D+ReU2CMtr9LdUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4152
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 10.03.2020 06:44, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 07/03/2020 à 09:42, Christophe Leroy a écrit :
>>> Le 06/03/2020 à 20:05, Nick Desaulniers a écrit :
>>>> As a heads up, our CI went red last night, seems like a panic from
>>>> free_initmem?  Is this a known issue?
>>>
>>> Thanks for the heads up.
>>>
>>> No such issue with either 8xx or book3s/32.
>>>
>>> I've now been able to reproduce it with bamboo QEMU.
>>>
>>> Reverting 2efc7c085f05 makes it disappear. I'll investigate.
>>>
>>
>> Ok, I found the problem. virt_to_kpte() lacks a NULL pmd check. I'll
>> send a patch for that.
>>
>> However, if there is no PMD I guess this area is mapped through some
>> kind of block mapping. Therefore it should bail out of the function through:
>>
>> 	if (v_block_mapped(address))
>> 		return 0;
>>
>>
>> Can someone who knows BOOKE investigate that ?
> 
> Not sure we have anyone left?
> 
> cheers
> 

With latest linux-next, PPC32 Book-E boots to prompt:

https://paste.debian.net/1134272/

---
Best Regards, Laurentiu
