Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD53BE61F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 12:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKZlt46xdz3bZv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 20:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=SPPEQioQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=SPPEQioQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=194.104.109.102;
 helo=de-smtp-delivery-102.mimecast.com; envelope-from=jbeulich@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=mimecast20200619 header.b=SPPEQioQ; 
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=mimecast20200619 header.b=SPPEQioQ; 
 dkim-atps=neutral
X-Greylist: delayed 306 seconds by postgrey-1.36 at boromir;
 Wed, 07 Jul 2021 20:04:11 AEST
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKZlH5Ynkz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 20:04:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625652246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QhUKPoOttNGnhHG+0R6LnihQok9X9UZmTs7NpNGzM8=;
 b=SPPEQioQYNaxhpuzOPpK1hE8lwVwqoWcwKkKa9jkA9yW25tUbqesK3PylMGsUNcTQGKnS7
 DAQI4WbSFvNwhkMwdWECbNBbNK+b/1E0lZoMo3aXka1XvclwN2Nfv9hkI2rnlTuTPBbhXN
 zUlsXPy9vVicFapdQH2VmUTFsyImg3c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625652246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QhUKPoOttNGnhHG+0R6LnihQok9X9UZmTs7NpNGzM8=;
 b=SPPEQioQYNaxhpuzOPpK1hE8lwVwqoWcwKkKa9jkA9yW25tUbqesK3PylMGsUNcTQGKnS7
 DAQI4WbSFvNwhkMwdWECbNBbNK+b/1E0lZoMo3aXka1XvclwN2Nfv9hkI2rnlTuTPBbhXN
 zUlsXPy9vVicFapdQH2VmUTFsyImg3c=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-xM7cClxzPNu2EzeolSEwew-2; Wed, 07 Jul 2021 11:57:42 +0200
X-MC-Unique: xM7cClxzPNu2EzeolSEwew-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6qD7UvxaMW9plEvoLeXQXV9Qk6g/PlkLVuhOJslST+QHbdAhU6UDHdxMXVZ3SqXMxWcAzCjMreEH4NvGRAeMRzjIVcYg2SZoo1MynJYRPHAGakQb9+rlPtwuFd7wHBfg+5J38INEvRkYo5tw4GjEax7HmzH5k0Wj0OdQnszJjJG0LfJUQfyCmzZl4xVM9zooXUww0aJFzUI5Asf4h8/LJCIY8qyRF1Bu7FIYCZYJjCBAV+BeYimcH+0TgtAlRhj5ZueQSCIEHMQ3qm6am5xocgKj4GL4ONm7hPzyNVntuOojlxUXiKtPUfqwpV2xGQV/8CgJMiQkxOwZsE4E2/xzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QhUKPoOttNGnhHG+0R6LnihQok9X9UZmTs7NpNGzM8=;
 b=U8/62VVADpf0LfitwADzbvwq8uo78ALyfCQyLVg+JfHlxkoxqPjMDlZ1ZFfSrEf5urLLg+XbaCWcCw3toCGjqOSj7EBqntc2vPDAn8D5DZj6ODRxCgpEABV7d5+xHRRzMrGZUuRICyEnpMwy2gRw9jkFiWFifdpnR7B1Sapg5HLXOk8sCCq7aUw62Cht/IxJKcTCN8t01ekPigmypJ9bpO88gfmtr595xFLs/rpiPeJ4owdGGXPhABUQrc3lnH+XTbLTyp9qhBD62fuY03Z765D4RJ7Q1KrTp3GKa9X8i0LkGnj/9+IeXnkVRjIhRqut3MRVMkRzkyvr21cfPXeA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 09:57:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 09:57:39 +0000
Subject: Re: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
To: Juergen Gross <jgross@suse.com>
References: <20210707091045.460-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>
Date: Wed, 7 Jul 2021 11:57:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707091045.460-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 09:57:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 939c54ca-18a3-4e5c-163a-08d9412da79f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB244804EBAAC01ACCA3353D45B31A9@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMpEYsEqbfyztJr6u9sSmdDWhvBVW67kWtTJRDs4f2xGBRJti5F92TedJR5ABrdUvA6AYHPfhT4CtY5AdhaQJ2mfCLQdGSyEgK1XTJTjZEVEEe+QAddw7EzOP34boaPWnHV/Wlw3JEz536mcmKdHNoKRQrU8xEcUK46njot0iD57DqjYmR2lgbBPYPP+TFtVrHmbN6r1ZUlnglCdJz7xuQCsWIoWjD4doMqWfc3s4FkXLNMWU9WQt1rjt/KJA2RBpJC7jE1zScBJpq94TMuDSEKrTMpClXXTBQ+zR/bO5fKpv9AgNz9zUH0ookAXMuDl40CdhIZYcPpSwcxw7p4u1xMM7ASjQDaz0QpZmW160bxzg358pLmIWS4ZVRVmzzDGcKmTZPJj8g94OXHg5P8h4nEAdC2xPF4vDlJqeZ2wez/6yepJgdMoVMfULqKefOc5A761Xsb/I6pSTzEUnUgqtAJT9EFFWO7srWA3X/pxh9pgfvyi7eIi7/JJCJgbrV2sfEQsv9At+U5Q0ZAC1cMUDiF4BZi55jAKBVlcYVmr4IFZNUM8dZQGp9nO2qd8Wh/iZnHvFuD7gp7xwXGhbRkYj/xxHZdCKGn//lah0L9cEMh7FvfZZhxKjcJn+8CxBpr5eVPLTsV7QH0xtw+aoKde7f2H5PJee9q4VYhkRZNZ5tww80iaeMBeYpcpHCDHvHrGS2wvgkfFm8HsSJNInERdZ7pE8OlgcfYC5xE4ggym5ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(136003)(39850400004)(5660300002)(54906003)(16576012)(8936002)(8676002)(66946007)(66476007)(6636002)(83380400001)(2616005)(956004)(6862004)(37006003)(316002)(66556008)(36756003)(38100700002)(31686004)(86362001)(26005)(186003)(2906002)(6486002)(53546011)(4326008)(31696002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZpVXF1RFo4Z2Y4SytGcGwrSjJaN3lvak1kSHZHZkFVeTZpc1Y5SWV5S0o3?=
 =?utf-8?B?N2drTUVqZTI5T2tNR1E4dVNacW0rQmREY0VQRDZDdzVLRnRuM3dnTGp3MnlP?=
 =?utf-8?B?d3ZYN0x3dnNtaFcrOU1nREJoZFhGamVSak4vV1pzOHMyeWdqeGhRT05Ud3Qr?=
 =?utf-8?B?U3U3UU9BM3VsaERoRGxlSVhPVms0b1cyTU85ekRvOEZGY1RhYkIwL29MZWpk?=
 =?utf-8?B?TndLTzh3Nkh2M2ZvZlp4K0g4OGxUZ3h3ZE5TS2l3L0tqQXJHaXlCaFY5eGxm?=
 =?utf-8?B?V210clRKVGxYZE5YRDRYcXpzYVlac3lMYmtJd2lkTjFvL09YSkNJSjFobnIz?=
 =?utf-8?B?Nk1ydWxhay82SHR5d3Z5WW1VaXFvazFsWkJrVm9ma2VncThlMTVJOE40NWgz?=
 =?utf-8?B?UkVzOW5Ndm1HZWNDRkFuWk5zdCtzYzUvdUVhOEFnT3dObmtsYzlxb2tBN2lZ?=
 =?utf-8?B?WFliVVQwOVg4OTBTWGJNWnV5RlJzRGhtd3luRUxZZ25SazJ0dWcyV3hPaXNI?=
 =?utf-8?B?TjV1NExmNVhMdC9xaW50S2tSbnhGN2ZCMEgvWC8vRkE1TklScDQyWEx5YnpN?=
 =?utf-8?B?VnFWR2R1OUFmeHRMaVJjTDhubVRCN0dtSzdJYU95N0F5S3BBUm8xZjQ0MEU2?=
 =?utf-8?B?WklkcWh1c2grTW5qNGx3TWtOblU5OVc2M09vTVNrTExnaEtOSWJ6MmtRK1R3?=
 =?utf-8?B?Yi9MMmltalZFcVoyYmpPbmFBK3hLUGRMaVIwMjFnNjlxcC8zSVV5cFAzcC93?=
 =?utf-8?B?RGlpWU02VzBhamNUVTFlMjVrTmhodWlQNHNRZERwWkUxM0p1TldmUDdDY3pZ?=
 =?utf-8?B?eEo1NDc0RUhlVlBOaTF5Tlh5YzB4dFBUUHhVWFpNQmpFcU5jckVySEFHdXZh?=
 =?utf-8?B?czVVeElTT0taeVowRUcyNDJkZWlvaDZMYlNoenlGNHY4cTVuSnpXRXRKSFd3?=
 =?utf-8?B?a2J4UE92L0pWOTRwSUc1SWNqd3Q4V1B5d3h0V1lNUDBQZ3l6V2dBNEpyRnFt?=
 =?utf-8?B?eEpjQlpTd01rd1hFSlhGbFdDSjN1Yjc0aG1NM3Y1UEpiY3REazhyM3NEb3NF?=
 =?utf-8?B?bFpsbHZKc0NkSVVDVm5Lc0lFOERwdlREdzh6QXZWTUxTblVIYWh5QmpYQmRz?=
 =?utf-8?B?MW00djA4TnNOUVNyWUVsNmJtTkZnTHBkMVZ3Q1ZxRzdiUGdjUmdUTDVZbG9R?=
 =?utf-8?B?WXVRTGpkUENUNVhpbHZVU1Ruc285OGFJSE9ERXF3NHFLSUJlNmlLOTlNUWg3?=
 =?utf-8?B?S1RVUW91SlRPY21uYnZXOWw3TU1TVnQvaXorTS94WENoWFNkNmxWWGszQnl1?=
 =?utf-8?B?bmFGTjErZ3FiYXRDN3dhc3pJcEpDY0ZBUjMvTnNWM2JGdGIrV05ZNFpXdE1C?=
 =?utf-8?B?U0tnVDMzaG5ZZkRET2FGOGlkbEg1TmxHRWlLejFhWnUvN1dxT0NYQ2hFekVM?=
 =?utf-8?B?ODRzem9acU9TS1JlNmZVSFFyQWRNWGIraVE2M1p6c0g3NWZIbjJKUXpJR1Nj?=
 =?utf-8?B?TVZlOGs4dnljSE5KOVZJSVlMOXJadlplcHZSMWpwNFMyQlJmUzk2QWEwblM3?=
 =?utf-8?B?eGdRTHJ4Q1JVVnVVOFJDTGlNMEcyNzZFVkhlWGxWcU9aSm53aDYvQ3dvU3V3?=
 =?utf-8?B?OVFQNEJmcytIL01GWDBUVkdHZGRuTlc3Q1Ywdi9YWUpPanM0YjFsbUtMYzY4?=
 =?utf-8?B?L1FoWXJ1NE90ZmNHM3UvcWZWZithQWxRb2czREhQMmdSMElTM1h6blRBNXpD?=
 =?utf-8?Q?37uOsDpU6yaHEnN+uFZjm0Km+2CDQG7lX7sze+b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939c54ca-18a3-4e5c-163a-08d9412da79f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:57:39.2809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGSajIpUmZPMWXne6Q7M0IlmEQ+/Z+QWjzbaRGg7W0ydTROPfjo5Bq/AXPCWZnOraGB4jz2E2qJIOvrcLhLVAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.07.2021 11:10, Juergen Gross wrote:
> Xen frontends shouldn't BUG() in case of illegal data received from
> their backends. So replace the BUG_ON()s when reading illegal data from
> the ring page with negative return values.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -86,7 +86,11 @@ static int __write_console(struct xencons_info *xencons,
>  	cons = intf->out_cons;
>  	prod = intf->out_prod;
>  	mb();			/* update queue values before going on */

Largely unrelated note: While in general the barriers here may want
switching to virt_*mb(), this particular one looks to be too heavy
anyway: a read barrier is all that's needed here afaict, just like
there's only a write barrier between ring contents and producer
writing in __write_console().

And btw, since I've got puzzled by the linuxppc-dev@ in the recipients
list, I did look up relevant entries in ./MAINTAINERS. Shouldn't the
file be part of "XEN HYPERVISOR INTERFACE"?

Jan

