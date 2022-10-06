Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435145F61BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 09:36:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjjtN5WFCz3cMq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 18:36:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=e6Ny0THx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.2.72; helo=eur02-ve1-obe.outbound.protection.outlook.com; envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=e6Ny0THx;
	dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20072.outbound.protection.outlook.com [40.107.2.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjjsR15Pjz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 18:35:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWIhAcCg42l+TnQQXSSCUc+O8M20m5UfL/dASuDLYsiDxG3r+MfHFAHGl5kYcMv3b5+3UAWvy1F76mXh5PUHO2hjIxqgY7R+4J42MXIDpuGa5vSttSMEA2biIdQgSOfnkukHhMMSj8KOzBstOwQErnnD1lhyvEANrGe950l1XoeSCgDawJaNON+DFycAarhbQJEyyiOXmj1W5DsRizhxGT9geuihiwiJ9Rtl6oz8vyC92kUdu5g36QCqOEMMMOjLfY4xm5bCAlxIICELAvdimmkKFfplX2EAzZWVnDKsgxDR8+aDf5aW44j1KZKdZNm7kYrSIltSvXpqq06vlTS6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ1rnAn5SYNs2o4bleD20RwDLuDlxb9eiqL3WKwG5Ko=;
 b=hYVd+kjBxyPp8oDAeHTTQDWcYYVHtb/OZ9FXIwDcuWkr1BBPtPeZGVZn/O5BFr5YQU7n1fXTx/23iZkNoFE/0A7UgvxM4uHLd0hmV7Ly0BlEjf9zQdD963dkApWrrDptpQ1sYnz9dczWipvZK/Eou7zHIhzhEY/dHQtpX3fLoyIqZZDb0li09+gfDLB2e4JKU5KvGBR9aDsfkH2rk+iPxhkLv2xUgWiom6X7ZUgIMdlFFSRLH1SP5KfL/gXWGJJcggzitBqRjJc/CJo9fbJuvV3OZdFAF8sPkThxGnYsYtsOrRN+wNtULa5PaSuB75PtW4OibD456M1bHMgATiQYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJ1rnAn5SYNs2o4bleD20RwDLuDlxb9eiqL3WKwG5Ko=;
 b=e6Ny0THxjvojVdbySKq6M6aoLz6FwmoUBphZVlsqZ3CbItr9dpe3v2dqVRvuOj1qlRFvR91/cO8mYmHFaZX2Ewc1AEQgVKCc/1J6M3BQKAYpCeRx/COk39kU7YCeovyxDu6cIEdZwaovIqX17E0zi78fZLK5mBW2ccuvF5+A5j0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by PAXPR04MB8207.eurprd04.prod.outlook.com (2603:10a6:102:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 07:35:16 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::8959:a7f8:9e94:355c]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::8959:a7f8:9e94:355c%4]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:35:16 +0000
Message-ID: <f49ba8f7-8968-fc2b-3cab-6c41168b0b89@nxp.com>
Date: Thu, 6 Oct 2022 10:35:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tty: evh_bytechan: Replace NO_IRQ by 0
Content-Language: en-CA
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <23f608ca57e7e19bc7060d3e563de383e0b2b337.1665033575.git.christophe.leroy@csgroup.eu>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
In-Reply-To: <23f608ca57e7e19bc7060d3e563de383e0b2b337.1665033575.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0090.eurprd04.prod.outlook.com
 (2603:10a6:208:be::31) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_|PAXPR04MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 346f9f50-1fec-4941-2d79-08daa76d4fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bZo9DyQDuZURb8Qdhb7uP6v+dmWnNRe9u5IB3C9GQgISb/+B3E8Xz+fKw4qzx/U26pTb8VzL2OM6SVOxaadX/HJsBtL7etKnYUVwHqCV5Fvo3HYZqqO+NNTIuzmrYi51iRwB2NZNmTDcBf1Cc+HNi3cH0yhAKUuIWkAUeQvVjop0fjcyANbJsOI+jmX70qa2Fi6EuQMoaxNWkfx69w2ZT39dfmnfNLxFgq4y0JvklhRXoXQn7eHQXI+U4RDaidEj/Ly2SO1tRiFu22XKkqOp1MjZIs7hbK3VWm2UEhThTFAv0K8WGp9cCXtHmJVe59fCRQYQeGr2R4Awe9CGy2nWwvOZB274pdF//YvL8TSDT6lSLFqAoKcliFKQtl90BsqLtU6NSWvrmSpA+KUCCLdpRsLuqau04T2jV95p58JCPr/DbaONuKIWlcn1j/59brnjuSfLwlm/skf4TFBl3fJn9eeEzD28mgo89sV2ZBnXvoRKAln3+mxuofJvExnWUmSZyo9yB27DICR0rEmywnfH77go6BuCeKE0fCxjjo7vxBSncAF9Obtg55fcHuXkF5uxXbthMP1UU9U/9oLWqC0S3hqcKxqgdiu/eG6/paRsYZxKsyniGsaXEYQAk4yM+WzJP18wLK4qpSgqgDDEzVhSZ5XdxsHfpEUzWckwIVWO2H6iZ4w0Dr8me9hkoUFbhxsKg1IKyt8UL47+BBZ5MxeVw73MD9Y0aPainRUacjBsW0sLuq+K7nevWho3n4daSX4tFROjz2dRqUWnRDRFSeBghc6oQC6QzoC9aYgi5Y9otFhFwYgruGZ9dCh27gaOtrWVJLKYsKFisPhFrDGCF6L+HQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199015)(31686004)(66946007)(8936002)(316002)(5660300002)(36756003)(44832011)(66476007)(66556008)(8676002)(4326008)(478600001)(6486002)(110136005)(41300700001)(38350700002)(38100700002)(2906002)(31696002)(6666004)(52116002)(53546011)(2616005)(86362001)(186003)(83380400001)(6506007)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZTdJTHhZOG1ZYk9wbHJDTEU2U2p2RDlDeUhLcXFSeXhQQ0J0MlNjbVdEN1c1?=
 =?utf-8?B?RzBpUXRZTmlUMStyLzEvejhCb2JGbXY4cFU3UXRZMm9uRUpVdTlVT2lYTEZQ?=
 =?utf-8?B?M0c1SzdrSUFqNFRpamVETDNlMkh4WXVQQkZjNkd6QmdXcUtyTEVmTTBJUGdK?=
 =?utf-8?B?d2NpL2dyU2xFSkZFQTMvU2k3dGtOZTFSSXl3MWtvWXRYaDYrQTVQbzBFV3c5?=
 =?utf-8?B?cE91bjVINGxBaitPa1dra0dyMjg2WWl6d0JVYW9zbGJlcHRFYy9KWUZhWjIw?=
 =?utf-8?B?ZG1mYUZJLy94QWtycDIrSUhsdUlqQTlhL3UwdEFibHQ1ZmNtZnFsamZRYUN1?=
 =?utf-8?B?T3hUS0lHbERhcDNic3dXbTRIUEt6ZnVLTFd4bDc4bXl4ZzJPS0IwSy9lMGN5?=
 =?utf-8?B?VmpZVUtoUlY4YTM0dVVhUzMzWUJRclhWdjdIU1F0YllrL0ptaHlvV2puZTdM?=
 =?utf-8?B?ZGlwaXB0QmoyclJaaEhTMjRRMXlwV0IwMFdENUNYanpXTklPMGkvcDViUVVD?=
 =?utf-8?B?ZFhJY25XM0JwdjR6L0M2dDlXd0l6U1VsS1M1blFXMGtFWno4a3lqM1Y0VGFZ?=
 =?utf-8?B?MUY2M1JjQnFkaG5VTVRDSkFUcCtTRVRnVEs4VEx0YWZsNjJDQ0l5aHZmSGtV?=
 =?utf-8?B?a1NxUHFNcUdrMXNPWTZUTUZIWjJTZUJtMlA3NXVXeWFpNVVGV2pTazZzbWZI?=
 =?utf-8?B?QkthZ3N3SHhWRU5jdUw1T1BqWko1NXVlY00yNVBtSGRQSVRUN0NlRVQycUlE?=
 =?utf-8?B?SWo3ejVuSTA5cXdsZ1FtRFdjQmZvY0d0MHpKNE1oTW56cjVJMWFMWjNXMjhK?=
 =?utf-8?B?RzBWdzh2R1V0UzBrVUNyclQvVFhEVkQvWWIrSmxteDJ6NjRrK3k0Rkwzb0l3?=
 =?utf-8?B?SkpJc0VnZmZDSXltVlo0SnpOVVVuaTRwOEd5WnhTNzd0U3A3dGxicFRRcWdi?=
 =?utf-8?B?WHFJODcxbHJPNzFSYkdVbEEyQlltdDJXVHJEczJCNmVsMHhkMEo0UVFIVEt6?=
 =?utf-8?B?T0xTOUVvTU8yWU1XQllLTVpnc2JPOU1HRzNvZXZrREh3ZHlZUXh1MzNvQm1Y?=
 =?utf-8?B?YVFMMjkxWEtGL2djU01MT3did3BNcWVRTWNIYWJsSS9VS1lrU1NvSkZpT2g5?=
 =?utf-8?B?NHl0WXFhUC8wQTRYdXByN0h1dUthTHB3TDlYSk1iTE03WXRONGtnYkJiQzRB?=
 =?utf-8?B?VHp3NGthQlhpQnNodHdIdEZCenQ5cW1NcVE3Y1BjWXJJOU1BSUQ0NWtHdkJv?=
 =?utf-8?B?Zm96bVlucFowald5dVY2MTE3SEJXTXFpdVZOcWpPd3N1RGt3Nzd0YnRuVVcw?=
 =?utf-8?B?Nk5McTBCdDBrWU55MUtMN3BhYTQzR0M5cTlIclFZbmFLZ0d5bCtOUTIycWd6?=
 =?utf-8?B?NXNiNCt6MGhtVkx4WVFIQXpURk1yeHp4RkVJM3B3NEtabXZldlVCbENweUhz?=
 =?utf-8?B?OWdOT2I5VG1Vbjd5UFY0cmV4UkVwMGF3NTRWSmZWV2FhWnAwNVZPZXdPTGtX?=
 =?utf-8?B?dUkxNzJ3VkkxWURrWFpacFRkRC9ab3Ayam5uZURMaExJSkwxZ1l4Q0s4MlBs?=
 =?utf-8?B?cFowd2s3SU90d3AyVHlsaU4rMXd6NEJvcUh3MVhKTSt5S3Z4R045cjZ6cEdH?=
 =?utf-8?B?OGNOTHR3eG0xeWVKL3Vqb3NLVTdWY0pXUms4aW92bko5VFZOR3RBbUxVSWlZ?=
 =?utf-8?B?ZGRlK3pjMldmNW1KUDlFSDVxSjZXLytwTTdldEU4d0EzU0JqQ3dPSHZWWHFo?=
 =?utf-8?B?bTA1bFZtUVZQYmpBdGhsQm5HeExHdFB2amlDekQ2ZU56aGhUL2tjQWpZK1ZJ?=
 =?utf-8?B?MG1EZXFLenMrUVRRclF4K2FoTGI0TEJVMHptWjcySGhzcG5WL2hYN1ZBNTN0?=
 =?utf-8?B?SlRCcUF0MXNZMk92NlZycklaQnFMeVJSVFBCam9uM1ROK2hCL1R4cEhYZnZH?=
 =?utf-8?B?aGY0Sy91SXoydFhjOUcxamRKcTlJelRNRWdpQmdBVzBQNnV1ZWN6ZmloaWtZ?=
 =?utf-8?B?enF2dkUrWnlCZW9DakxMZTkyb3dqZ3B6MmJ4eExYUDRRakxKSGh6VWRKM0dk?=
 =?utf-8?B?SzZ2NVRFa2UyT0xIMmRPOC92RDB6SDJlcFBGRXBMZFFhYkNKRnE5dzBwR1B5?=
 =?utf-8?B?UFlCS0F0UzB0ZkhWa2Q1ZTMvQmp0T3R3cWtPZ2FleDAxMXRvaDZFSExrTVFU?=
 =?utf-8?B?RWc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 346f9f50-1fec-4941-2d79-08daa76d4fe0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 07:35:16.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMERTfOdkPlSz13WzbfeceY7O0cwDFP/axil+EbA3yIcGkbA6Lkj4fe+kEKW5V9adWRJLZs8YRljyZWvbLMocg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8207
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/6/2022 8:20 AM, Christophe Leroy wrote:
> NO_IRQ is used to check the return of irq_of_parse_and_map().
> 
> On some architecture NO_IRQ is 0, on other architectures it is -1.
> 
> irq_of_parse_and_map() returns 0 on error, independent of NO_IRQ.
> 
> So use 0 instead of using NO_IRQ.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

> ---
>   drivers/tty/ehv_bytechan.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
> index 19d32cb6af84..8595483f4697 100644
> --- a/drivers/tty/ehv_bytechan.c
> +++ b/drivers/tty/ehv_bytechan.c
> @@ -118,7 +118,7 @@ static int find_console_handle(void)
>   		return 0;
>   
>   	stdout_irq = irq_of_parse_and_map(np, 0);
> -	if (stdout_irq == NO_IRQ) {
> +	if (!stdout_irq) {
>   		pr_err("ehv-bc: no 'interrupts' property in %pOF node\n", np);
>   		return 0;
>   	}
> @@ -696,7 +696,7 @@ static int ehv_bc_tty_probe(struct platform_device *pdev)
>   
>   	bc->rx_irq = irq_of_parse_and_map(np, 0);
>   	bc->tx_irq = irq_of_parse_and_map(np, 1);
> -	if ((bc->rx_irq == NO_IRQ) || (bc->tx_irq == NO_IRQ)) {
> +	if (!bc->rx_irq || !bc->tx_irq) {
>   		dev_err(&pdev->dev, "no 'interrupts' property in %pOFn node\n",
>   			np);
>   		ret = -ENODEV;
