Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC47901AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 19:58:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=IYRpdxxa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rcm3S381Pz3c8v
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 03:58:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=IYRpdxxa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f400:7e83::82e; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=mirimmad@outlook.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2082e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::82e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rcm2W56lXz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 03:57:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niFZEkGwQ5sbmR/QStZi86x8723uO1MWLZfmgDmZBrOsFYg9UewvbOXel43OGY4klBEBawEGYrsDvUCAl/Xsa1FmqXNNNjZEOjkvFYQuq7nY9VA8fmznXGdVpa8vcke6J8KNbwXXNPbcpAbvP3qIW9EVHgECbuqjySzxVGu4hJgUtEsFENxAhJMmvjpaURPvhfvcxpiOYKEQ15LCW/Le20/43cSse+Qg8gcO7HxJkGsiyeq9dks/dli0Way8uSH9mItpncJVYDSS0WWq42SNMcwMVAsAsx6E7L+kkxlsmoGK2TBs5hbcKD/8t8oA/Kf91Dr6mtbgL66xrGyxuC4zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1ZynWGcidKYiEJ/mWEkqJw4xggKHlyyM77AMgaki9Q=;
 b=LNv2mQGVIQ6UWhANfVuQ2oMiUGRR6a/klP4B6v0F6GbMHKMca7AzwiJm4EjXRFFWIAvjmsx3BRCwxgWmYVmJRRrUtIs4fgynVwf3ViXXD3SggCgqZwKnlSyZQkn8XZVpUNOcgCqS0w8gFfzBW6HVQKDDoYc6pJXMIDjUPfi8YUmFXtRy1RuytW2bWImwS6hxH5lQCxIg+9fnEKTg0qc9XdJ+oAj5YlzJ6fyyVCAnBU5jJx77bmAmhMkNsXFJNXuoIHlZVjMbwTQYqyexJNVLYdS3t//KEmjJQ6dhmgGubeiFkL3N4jh9X9BhLlwIS4tL66ybZB5EBDD1YU3DhGPr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1ZynWGcidKYiEJ/mWEkqJw4xggKHlyyM77AMgaki9Q=;
 b=IYRpdxxavh8wvDirp5lP1QwRFVcVroAlJ/WdsQhLgOqUpM/lq2Mv+cXGcMbs3DNv6AV4/w4M+pyJyLqav+ZMiO9vJ59vf0qerd32mldm0um8/1VK+Sum2oGg0b5MLu987K3BFbCg6dnfx4l3JvLpnOFeGNFFKbLK8RJ7kfW5wbhXtWwxma6nqzWOMHsT5pvml0tck3ExTFSbULCkYQZ+6ezERvGnx9oijj8iI0zvPKIv1J/epoQoHxE4F8qPrZRUMyTZGKVFEXhM0R8naC6i6XKb4n+XNT0SiVbcn63VZUPwNEeANHcRu/mh/OBR6SIDH5fWYE3CRW4+YnYgdr/gHA==
Received: from CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
 by SA1PR12MB8859.namprd12.prod.outlook.com (2603:10b6:806:37c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27; Fri, 1 Sep
 2023 17:57:15 +0000
Received: from CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::912:a56e:f6d2:86fa]) by CY5PR12MB6455.namprd12.prod.outlook.com
 ([fe80::912:a56e:f6d2:86fa%4]) with mapi id 15.20.6745.015; Fri, 1 Sep 2023
 17:57:15 +0000
Message-ID:  <CY5PR12MB6455C60885A4145B72B8613AC6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
Date: Fri, 1 Sep 2023 23:27:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] powerpc/powernv: use appropiate error code
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <CY5PR12MB64550ACC0B90FDD120D21E47C6E4A@CY5PR12MB6455.namprd12.prod.outlook.com>
 <fdb8d83d-84ce-76d6-db9a-bb232492170c@csgroup.eu>
Content-Language: en-US
From: Immad Mir <mirimmad@outlook.com>
In-Reply-To: <fdb8d83d-84ce-76d6-db9a-bb232492170c@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [Gti+oqXKvrt31T3Bqp3kOVROE7k6sY8oSIqyBfK6pPKVRy0jlUVxTlYj5M1wt6wD]
X-ClientProxiedBy: PN2PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::11) To CY5PR12MB6455.namprd12.prod.outlook.com
 (2603:10b6:930:35::10)
X-Microsoft-Original-Message-ID:  <57c58f03-6284-8ea9-c0e4-f3b0e0f947db@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6455:EE_|SA1PR12MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: eedf422a-b644-4177-37ac-08dbab14e00c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mnCl6Cv48/cgkiStoyOKrbJzxK8OyU8KaRDeyVmEitGRSXY/vWIXd6A+lnofMtEGj9FV5KOTC3zKJzbndwe+v8So6nle/QkUv7nKkVomqcsPGBTwrR9r+gcC/bd53tA8Fv3hIAKnbFCQSY5pDp6JmLMrbZpPFAXllDZOixkjbrZiMJxeIxOHZGTeDVf/Yd6G5DYqbbN4Bzjxqwg871WA55kQaagvNIQP+3JrO3cfLxolpRAQepMmKTocI1Hisq8x7sBu0eSc8nVOUyJF6K1hQgWn7DnlQt/18c56ym2rre62CQr6wU3Ui68wXYiI26GNFgLS+5MZaBG/ue9O77In6xlFPZrWUlDIGr5Wg2yqXGovq5sD6NUZF3U8IeVYTAQl23W2lL2Eg6+CKmAljt08ouWkRt5BP5Bw0v5NiUSOgEOiEYEE2PGN7+XrgXbIY/TFKWNaJfhe4aQbBQzFk1ut2AazB4p4NkCu2tH3r/i6T/9Swyvf9/7FRu2sAfRu4c6V8wcLRNRmjvv4agMKadTK49H6n2RbbSH/7QSQEHKipy4nRLVhL9s9mi4KZK9M6i5/
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Wkp0RHptZlU1TGloUmMyTHpxZTJDL1NUVEVmTVJTeXJiUWF0b21EZFNES2lh?=
 =?utf-8?B?MTM1cXNvWHFFbXNnc3FBM3JoVE5YRXExbTF5R2tLTlc1dVg0QjlCdFRITWN4?=
 =?utf-8?B?VloydFgyY3N4c1Bkb0NZekJWVFFlT0J1Y1YxNkZyN3BScklUZVBVSkFZdGZn?=
 =?utf-8?B?azZqVWRENFdHMlF0bFJWZUg3L1RtbVRobUVDNDI2eGtEdzVVUFRGRi8wU05W?=
 =?utf-8?B?a0U3OUJXQ2sxeTZkNm85OUpKa0RQbCtWaExoaGY2cGxuSE5sbDREOGtTMmxo?=
 =?utf-8?B?a2s0VURJYWo5eE9RSW9FbkVYcklqdWxLL3BtYlVBb2JNYzdQZFB5R08wbWVt?=
 =?utf-8?B?WTZVQy8xUEVGZ3FBS3U3MC9qdWJ4cmJFVVZsMllxaTk5YUtnSkRaVTlaeWox?=
 =?utf-8?B?Ny9yNXNXUmtadDN5ZlZDdjZyUmpmZ2pDZnh6NnJRaFN5OUVJclhFb0FObjN5?=
 =?utf-8?B?Z2lKZTlpTVZON2VYeVN4YlMrckxJREM0SFYvUWlWbzBNWHBaS1cxUGVXZVFz?=
 =?utf-8?B?VWZraWhKd0dWaXhNN2xXcTN5ZDFZTVNBQisrNmJQUzQyQ3BlWGFVVnE3MXVF?=
 =?utf-8?B?b21XaldURExHUDlPVGplTjVBcDIrbFRSOUR1cXpmL2dKUzZwbG1XU2FyOGhK?=
 =?utf-8?B?RWpFSDdFZjVLUDRUWENsZjVyVWFYS2prTkt3bmppMXl1aVVGS2JjKzR4Y2x5?=
 =?utf-8?B?QUpkVytmVk5iaGNLbHNSalZ2d1ROeWxybE1ETXRQYlFXMWpFd2phQkFJQmJr?=
 =?utf-8?B?RXVWNEtNdzVxMmlhenZiYkdKNGloWkk4N05lcHNNMC9obXZZeThnU3FMUUlo?=
 =?utf-8?B?Q1k2Wlg2RlkzWFljSXB0TEZYMjRjeUJubzE4ZUY0UHQ1VWw1WHl2K1gydWpn?=
 =?utf-8?B?K3JjaER1d3RSNjJEUWU4djN1ZFJieUtBbkM1U0JSeVFMSm1OR3FqZjRMRWJo?=
 =?utf-8?B?cDB3SllHS1JmbVpHL3I0MzhRcVRIcWZiWWxNbUxKSU5GNCtyUzVxc055OVhj?=
 =?utf-8?B?Tmd1elBuOE5sSU9XVWpDSkNEMFVneVh0bmk0dzNnSUpzZDgxeHlUTWpDWnBl?=
 =?utf-8?B?NTV6R09rS1FRZHVWTHRReTJiWFBidGw2Sk1sM3k2Mko0SlBBRUVVaDYvK2cx?=
 =?utf-8?B?VUFHeG03TzBIU2pNdmVIN253cjdoTnkrb2dkNVFNdzJnWGFLUHcxVGx4YmtT?=
 =?utf-8?B?LytqNElDLzVnSjU5M0JacDMvTHByUFI1MzFqak03QjNmQ1BGMlMrWVkwSlNu?=
 =?utf-8?B?ZmRCaWd0SFF6dDliNGk3c1ZRemxFUGdYSFMvSDFuNkZiNWs2UkJGUTRON3Zo?=
 =?utf-8?B?Yjc4NmpPRWpsSXNRTjR5b2svbVRLeW5oak9mTGllSTNFcDh2Z2MwSWdOSkd6?=
 =?utf-8?B?elpzSm1xWndjb3RMQjB5dStqdnNnWkFRRmhoK3ZyRjgxUHY0Y0YyRTRCblJ1?=
 =?utf-8?B?TU9GaUdqNm5iSFRqSWVSR24vajg4c2lBQ1hGbDRiZzlqaGIrTjFoRlQ3UUFj?=
 =?utf-8?B?ZFZNS1owTXhqUHpNTHNVTERCeFJidFdkSmZ6VjE1cW5YTCtFNmJBMTJPRXZR?=
 =?utf-8?B?M0RIUXJnR1Q3dXlJR0RIQWx4U3UxK3N3UWhqTmYzUWJaeEppdmJaL3o2ZUVL?=
 =?utf-8?B?dWEvTkxRT2NiS3NGZ29xZmVpSko1NE5oL3lLeWVBdFUzQ0llbUtCWFRZNXIy?=
 =?utf-8?B?Q1FqOTg3QUp5UnMxWVRBVzUyK1ZoY2NBQk92MkRDdnpVa2k0NDhmWE9RPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedf422a-b644-4177-37ac-08dbab14e00c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6455.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 17:57:15.2461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8859
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, open list <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 01/09/23 11:10 pm, Christophe Leroy wrote:
>
> Le 01/09/2023 à 19:19, mirimmad@outlook.com a écrit :
>> [Vous ne recevez pas souvent de courriers de mirimmad@outlook.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> From: Immad Mir <mirimmad17@gmail.com>
>>
>> -1 is not a valid error code. This patch replaces it with -EPERM.
> Can you explain how it will work ?
> In scom_debug_init() rc is built by oring the value returned by
> scom_debug_init_one().
> What will be the result when oring some valid values with -EPERM ?
> It was working well with -1 because when you or -1 with anything you get
> -1 as result. But with your change I don't think it will work.

But Isn't EPERM defined to be 1.


Immad.

>
> Christophe
>
>> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
>> ---
>>    arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
>> index 262cd6fac..ce4b089dd 100644
>> --- a/arch/powerpc/platforms/powernv/opal-xscom.c
>> +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
>> @@ -171,7 +171,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
>>           if (IS_ERR(dir)) {
>>                   kfree(ent->path.data);
>>                   kfree(ent);
>> -               return -1;
>> +               return -EPERM;
>>           }
>>
>>           debugfs_create_blob("devspec", 0400, dir, &ent->path);
>> @@ -191,7 +191,7 @@ static int scom_debug_init(void)
>>
>>           root = debugfs_create_dir("scom", arch_debugfs_dir);
>>           if (IS_ERR(root))
>> -               return -1;
>> +               return -EPERM;
>>
>>           rc = 0;
>>           for_each_node_with_property(dn, "scom-controller") {
>> --
>> 2.40.0
>>
