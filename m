Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B29F5964E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 23:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6lF144Pkz3dy6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 07:50:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=XZMk7WjZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=virtuozzo.com (client-ip=40.107.104.130; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=alexander.atanasov@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=selector2 header.b=XZMk7WjZ;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2130.outbound.protection.outlook.com [40.107.104.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Tsx6L13z3bYd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 21:47:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZPOPD2zbfdyOhzfTzZ0FVYPXOloC8vPz9q7onnFF9m8ZCQfDBUX8Y5wJjHEBcT3kmHM5aEUWa/TGAVu4i4YKfmz/ygQVdnAH5fPRSdOWE2WRCkDeDuwSBHJEY83xFYe15QFt/rCwxft4CiAIDS7vDaSLuCVP8/HKGE+BKduz2+ApMJURVYJG5+Giii6PwTWlyiENcqIT4FcqNAUN+Ku1Ul3HtB1OFK0qGAvr3Pvh7XEQpgJRCR9h6oMjQsv1lApL4pcOtKaJE+T7SxBH82oelDJ3PQPVQphrPaPlHnsqSnFP2X39SerevOhj03TqSCLzeSPrvqVvUPFx8851Ivz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otzQ1Tsp5qqxOK2CAkXFTOIcx+DKpZlSHdPPPspIe2A=;
 b=KCsSB8615OacoY/ySQOBKCN5QbE8TKJOWPSxBiguOrMmXVusHkqyo6RcutXOuYtwzPWlgNM6D/ooMnhym+EOtqI+NyQQVdLPgXUeOSBIRuVwIwmIGqh3m+THgt+1gtPLi2ezDe4x5gvsvcXZ+D5ClZAQC8QRPKxmDzbwEbJRZa4xH+oVdYukbofnOgl8bgpqpy6+gr8ZzEl+tozgn6aE/QzwEudBTvPcZxd7ueqIhGe1x8y7fmpXkBFhhpm8DOq7dSxChHRdSbw18X1CAoqg/3Tuzq6Bl7pEIc2lhuWh1lR12ICGrk+6bNIXGYoQ0jbq8LtY3bC8Ox8/H/1HCuPSHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otzQ1Tsp5qqxOK2CAkXFTOIcx+DKpZlSHdPPPspIe2A=;
 b=XZMk7WjZEJWdmN6MBV2Z+kZuNbBeXc+Bk+6Ihp2/uoc+B39xj9ff97VuWaSBxR5uOrmVV3aUe06UNWikeJu/S7DkYTSs4ARS0RSbVRO5D+OFULSpkUw+8MTmjXZzFTM0c09VoG4Xbmc21YSAWIarHz1AX2wphhJxQctCv8YKCdTMyUblbYoLM09az43U0tQHCNcclPKW8QWkCB4gBPv3VNDyXshuwj6RNqkwDdikf9VWG9nSluwYGVNB0yOai4Uvf4/jnW673hJaCUqPvXtY7i0O8O7JHGPQhHqFFpBpk/iS4fkCJGZGNNB2l5+0lXg+bVkNtWVroZT63U1CkW8QdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from VE1PR08MB4765.eurprd08.prod.outlook.com (2603:10a6:802:a5::16)
 by AS1PR08MB7540.eurprd08.prod.outlook.com (2603:10a6:20b:470::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Tue, 16 Aug
 2022 11:47:24 +0000
Received: from VE1PR08MB4765.eurprd08.prod.outlook.com
 ([fe80::cce4:bfef:99c9:9841]) by VE1PR08MB4765.eurprd08.prod.outlook.com
 ([fe80::cce4:bfef:99c9:9841%5]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 11:47:24 +0000
Message-ID: <f88fe469-d4a4-3240-b325-a745255bf01c@virtuozzo.com>
Date: Tue, 16 Aug 2022 14:47:22 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 1/4] Make place for common balloon code
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
 <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
 <YvtoDxvefWUJBfAS@kroah.com>
From: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
In-Reply-To: <YvtoDxvefWUJBfAS@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::23) To VE1PR08MB4765.eurprd08.prod.outlook.com
 (2603:10a6:802:a5::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9daf0e5b-ce1b-4753-113a-08da7f7d15b3
X-MS-TrafficTypeDiagnostic: AS1PR08MB7540:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DOarlrBtFeQv2w/Hk1YerkGrCjtZtsSh63oOaHM/KP2al7x1kWtx/inMqwKDF4MelP/DLyPBbYmTazUsDiVbET+py+3K1YE55hYXIdtmKBQgmQ+NFnI8n2rhJD4r1hwCk4Uytt9l+7iAXKrbg8chG0GmAI72hbI7G7kTT3oGcGcFGjnoHqkGaWXVxzqlZRpvA2ZqV85wkFMBvEBbJllQRzijQOTfDbEWOrhyK9HQk1cxK3FgGmpjRS5+vAVlBCDoj8GgIgDEMY5zkniAEp1rXBZzBq5A5s2z3Au+/rXmp99EzxiOvCX12dgVmfZ14Xs3p5GMi99M1JsVj/WJVwOSN4/OnatsF4W8UNpqEuJwyDwIZWLRRoFPl9gLwzRsvg0UeJ/TtGDV2Y5WFS7Y0hjM+bvkTwSxXfQ7PEokJnh652nO/QsZa+Fjo9d0EZ8nPjQy9CUHhe4vJDzSKEgOZlOKJ2T1bgOtMcb3Cic/95xsfMVUCRDi8z7n9H1pfA5hDhQ6qPA06W56ayYMV0K0Xwr4DGueNNjBI3rx4+Oj+pAEX5trPg2XRosGziwdDliBkTYxZakfXRT9cu3saw9pq/aEN0Z1KlJcYoIEJ8uSG8CKx5wSBhW+E1MW78Hgiar4g39/gFwXDdNCQ3jE+gzL+r7/YSNhoR0dzds+0euqhEOBvX5Zn2u1Aw6K76Ddzp/VFKkKRGw7a+eAxebH4GSpSJQn9OhTObQ6iZMYmeDbWVCPk+lDFjVJaBQ8MgDhcl3SNyNFj0D+3JKH8QrNINy3sm7QotAusuZzHKzASM6al8mtuVTviJ5g9OvnDjK/iPxolJSL3EancGhJUJj5gyb57aNEBRIQ9+HlcYbYk+bqYKjeZ0A=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB4765.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(396003)(366004)(346002)(136003)(38100700002)(31686004)(2906002)(4744005)(7416002)(8936002)(38350700002)(36756003)(6486002)(5660300002)(44832011)(186003)(2616005)(66946007)(478600001)(6506007)(52116002)(66556008)(316002)(6916009)(6512007)(26005)(31696002)(86362001)(54906003)(66476007)(8676002)(41300700001)(4326008)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UlhUZmVURkRhYWVDRG9ycmorSDJnWkxoaktMdys0blJHdVdNZWxIVndaaTJ5?=
 =?utf-8?B?VEkrL0FyVk1DUHRTUVJJZFViQUxvMWE0T0ZMWFNwY0QreWNyNW5Hbng3dEVL?=
 =?utf-8?B?WEFBbC9rcTc2aDU0TUxHRk9lcExNdGQ4UVU0a1h6SmlBNWhHMFJyM3kzbHdU?=
 =?utf-8?B?cGQwbDhGOGdkV2hFb0tNQWZTakhuUHBNZ2t0bHAxV1dSVEV0SXVPYzRwQ2pq?=
 =?utf-8?B?OEY2cFFsNFNYZVRRcncvRVo1bWJmSGVRZUU1UU5lOERSNmlieWRJaW1qV1BP?=
 =?utf-8?B?eldrclNDRXI4SCt3NzJNN29qdUxZWEdlVzlFNHI1SzVPSjA3N1ZYVWlpcnE2?=
 =?utf-8?B?Z2RkaGdtMGVCMGNkcXB2a2ZFbkZQL3EvSHJwaTJublhXanJ4dlpTYWdUV1hr?=
 =?utf-8?B?L0ZHTXJ1a004MHZrbVg2c2xkcWI5N3ZGNmIvcTAydU5kV0tvemNlOEJhVk45?=
 =?utf-8?B?dlFPSWdyOUZGamRlSTJGNklqS2lXVFVmK0doa1RFWGVXNlFLUk5idXkwZGFB?=
 =?utf-8?B?VWE2dU85c2FXYkQrOWEzUXVyTituQm10ZllLUkswd1NwL2J2T3AxRjJsODJr?=
 =?utf-8?B?RjZUQUVsM2xreEcwN2F3R2xjdmN3QXhyVlhUUFBkanUxbTIwcTVlM1JNd2FI?=
 =?utf-8?B?NnZwY3FqVnIvNXpaWFNLczB2ekpzWWE2b2t6eVFrSnNrblpVd3Q4SVEwZ1My?=
 =?utf-8?B?a05nZ2RMd2o2VitXaWN5aHlpTmtuekZZR0prdHRMTy95ZUlVcmRrQWFkLzM0?=
 =?utf-8?B?YVdtRndzMnZDeXB4YlFxNENmUWFtMnZ0OHU4cXlVMTNXRXNLVysrM2VqdTVN?=
 =?utf-8?B?RnhuMHQvZ2JwOEIyRlkyeS8yaytCdjROeEQzcFJNU1pFK3ZkVjlFQWN6Y21Q?=
 =?utf-8?B?UkpuaW9XT0RqeHc2RXVBQ09JelRhTzR0NlBJT0lUdjlkWXJjOU81OEZCVzd0?=
 =?utf-8?B?cDVEWllaNlpid1lDdzloMFBUd2w0SFlPT0g0SGVaK2ZqNU04SnBIeXdvZWlQ?=
 =?utf-8?B?MWxzeVJnSlNOTkorTU93UkNqenlZcGtjU05NWTVJd2ROQk16T1NVUXhWUXM0?=
 =?utf-8?B?aVFJZkpNU1RBOFpsRU8xajhOejlXSGlOcjJVUmFkTWxTRUlJRDVxbXVRY0I4?=
 =?utf-8?B?NGZDVGFsN3pwSElYQVBNOFloRkp5SHdnSU5QYUVTK09rNVlOREFXRnlmNmhq?=
 =?utf-8?B?cXJJSEQ3am1MZUk3bjV0c2NlOUJENVoyM211NzNlOEZMcWhtbVlLc1pXMzEz?=
 =?utf-8?B?dU85cnZpWmVibUhINUpyYkdTcytUQmJ4UVpvS0dlbVNlS3krREpodmg3Rzl0?=
 =?utf-8?B?TXRINlRkSVd6Sjd2Vm1zNmM4VnhDQXhJZ3hoVFUxbElFK3dSaEdSSzJzTk5l?=
 =?utf-8?B?UjhTVGF6SkVjTUpvb05YRWYrT0FyVDJFWXpMVFY4eitCVThBVUdtVlBjVkFO?=
 =?utf-8?B?TE52N0JiU0F0WHhZUGVxai9NUUszQzBmMG8vK1dXeDFMUVJ4dWYwWGRTTTNZ?=
 =?utf-8?B?amZ4MWdFVVBrZ1F2ZUQ2UUN4cGZtSHVIS0tWRlFJdGZSWGtCQXRSUWxvdDlF?=
 =?utf-8?B?bzhWb0xwYTZjZ0pITHBrQ0I0YXRVeEFlU3VOOVd6eFN5SEFITytSL1hNWjVi?=
 =?utf-8?B?c1dwaEtkdzI1djVrV0c0MUFzR0YyM3pUd3lCWFd1RTZQRTRnL1RwT2xoKzhk?=
 =?utf-8?B?Q1F1SW9sTkRDWU45THI1dW4wWm5TOForMFowZ2VTb0VjQnNlUEZxblFDblpU?=
 =?utf-8?B?SGZhNG1ZQ3AwMlNyMmxXdDd2N1R6MUVVdzdvTUE3UXgyTmJuLzVUVnZBeTRW?=
 =?utf-8?B?b2puZThqRHdoTVlvY2NRcmpsUlYrMHkxY0NvOUNlOFJTNDdBVnJac1l6WWxX?=
 =?utf-8?B?VHpWQlF3TjFNbWFrQU0xekdOZmFtSVBDS24walRyL2hiU2grd01EVzVSSjln?=
 =?utf-8?B?bk1oWWJtQ3RkUW5neEh1Z3ZyTUdMV3JDNWpIRUNlaU0yRW0ySFZqVU05aWhF?=
 =?utf-8?B?Yy9LTld1ZnFKSUIxeU5veWVGMUNCU1dzQWdwVTc5V3ZtZWFkWG8xOUZmRVBq?=
 =?utf-8?B?TkVTUkNEb0hualg1TE01eWZzNk1jK2Mvb2xZaG1LbjlBVXNmdkxFNzNKdTFk?=
 =?utf-8?B?M3BxTnRSWVltZ01rLzZUMDBMZ2ptcU50NmE1WlJWMFpBTlJtT3RIQXM5VmxJ?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9daf0e5b-ce1b-4753-113a-08da7f7d15b3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4765.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 11:47:23.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzuGyIL5AJKNTw3j6UmCblWIa1ykoOWMJ8FOKZH8Ucoohy2rl9srEwmJ+ShyzKSrNxZIiJzYjgEBUUs7q0Y6HvJFd7kJBiaYCl4h007lGUUPK8Gq3rewhTsPJ6c7mkeF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7540
X-Mailman-Approved-At: Wed, 17 Aug 2022 07:48:41 +1000
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
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, kernel@openvz.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 16.08.22 12:49, Greg Kroah-Hartman wrote:
> On Tue, Aug 16, 2022 at 12:41:14PM +0300, Alexander Atanasov wrote:

>>   rename include/linux/{balloon_compaction.h => balloon_common.h} (99%)
> 
> Why rename the .h file?  It still handles the "balloon compaction"
> logic.

File contains code that is common to balloon drivers,
compaction is only part of it. Series add more code to it.
Since it was suggested to use it for such common code.
I find that common becomes a better name for it so the rename.
I can drop the rename easy on next iteration if you suggest to.

-- 
Regards,
Alexander Atanasov

