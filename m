Return-Path: <linuxppc-dev+bounces-12018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75169B52815
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 07:16:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMm4v6LD2z2yFJ;
	Thu, 11 Sep 2025 15:16:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2417::620" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757567807;
	cv=pass; b=MHLFC3De08HFc51TRdR0oIZ4sgpp7Un8rlqi7idKi0CsuwYZAR4Ux7VBnknunQwDFtbQ7weUmBq9OyvRAcLY4giG5RxVA9i0DO4pdAdQCeFlI81H8r3I+/QRKOjKtOuMQSOpMxlyNLUJK9wcEYIP8tlqQeSt2bhb9hLt76QEFmP1KK6F2pLWblmXwecE6hAxYKVU+kH97LgkNpDeCGfPdDnwBdvQtkaca1BvZC+ApvApIQqfWRmTWhw4W4EIs9RGv6lln3xR+K7ouGmbyEforv+oNncugNPBJOB6+VSHKu02yK0PlM2MkcFE1fCwg6g/My/h8vObSc8n4X0ST+tkaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757567807; c=relaxed/relaxed;
	bh=KCtG/Urn6ho2+vnKkN0kJ6nwoT/N/6sWRdZ+lysuFvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VfK1ObzlRW6UP9gVSiFsFG40It5OVTWOsQt2q9ddOjF7TD6cDog9v3fujMkYWfI1JbxqOILlJeWXQo8YsgDX//if3syN482ZJK/miPsPpyKaQAUyyLtQLXk1APOIT/4NJQJnvWcJYNEskSlkO0wKLAnIqmlebApdj1yvmMx3KH1bqmFe3ewtMlSmInkF1P/Yse+COBzyLdI1scd12tkRPFMoONUaDl4HPYCERFQViOi0LCV1dncA3BeKdL5QameLC7iEuAlGPzpCYYXM6x7nwKZl7ngDzjp/HJbZbhjWWXlnDO5BAPwHon1ve9F/dxV4jMnhgg37FtbS61KY+Xjw/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1vzJztiK; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::620; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1vzJztiK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::620; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20620.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMm4s6R8Sz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 15:16:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEqgdgd39tItNZoVT9ntcs0DSls03f5tVOZILIZ4SsIAuWqDTYAlXcgcDQ3CH9AQ1F8o1mHBN+LlxRW3naZxyiTySoKmgnDzJP4kwUcpekHjzQAFqvwUp5rBhr3RCNb8XysXhxUwKCRppI73i7zlAhatqvbbONhGdQw0qf/cNcZdFMFfP2e5krGYFYSXkT9EWqogBKj/VrljgWnbq6mDwzDfc0yGmLNv3dIhwJAQLGlLBpVBvrjkS7JV771vmE5vUkEDlyczW3b1n99G6Y1wvPo43zei0LnAHnLjGytDBlmnA5ND+/jlbqi15Chgl95jNfJMRxRvdqORv78r0cJXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCtG/Urn6ho2+vnKkN0kJ6nwoT/N/6sWRdZ+lysuFvk=;
 b=RqMXX3UP+u0c0gXvHW1vCQSSsyx341SUOU4LSQEdEOMSeEV97hsA7Gdx36v1PrmLaoZhu+rsfaLawU4IYVFuK3OiEaVmNmbcGGA6KDRWvtQpk30+dDacoEpHenCRW6/UWkaMDj8bRdlC0uXaXtn3GEpeflNLE1GcfUvob4Ne+MzyD9W89eHNKbPJ1O120VFA9Ln2Dw6pJRM6gOBzYpS0MnbQOpk5PiWHjgnj61mWQ6+ptLuF2/DCSstvX7LGHRrWSOKqIaL4/RzwQ+osv+I6GCB+Q6Zj/O1nsQ4T83EtMMnpgvni8pr+KbE4VoL8ksxu0MMaVlUP3oFkUU5C1MLV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCtG/Urn6ho2+vnKkN0kJ6nwoT/N/6sWRdZ+lysuFvk=;
 b=1vzJztiKFREd1GnIckM38m/qaRmCIqLVjt/x0pzpV4aYhTOn3w07SWMJd36G6QmrOHTD/85v+lUEWgTH7u/lpWGt0H3x/+d3+Qgg275gadAUeEOUPEiDSECgMwyhKqGY117DWsOVn3BKc16vqNR3DQXZy+2Okdi6R54ymEsGDeI=
Received: from CY5PR15CA0235.namprd15.prod.outlook.com (2603:10b6:930:66::7)
 by CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 05:16:21 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::26) by CY5PR15CA0235.outlook.office365.com
 (2603:10b6:930:66::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 05:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 05:16:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 22:16:19 -0700
Received: from [172.31.178.191] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 22:16:13 -0700
Message-ID: <d5605402-b37a-411a-aabc-842b5a924dbe@amd.com>
Date: Thu, 11 Sep 2025 10:46:12 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 04/10] sched/core: Dont allow to use CPU marked as
 paravirt
To: Shrikanth Hegde <sshegde@linux.ibm.com>, <mingo@redhat.com>,
	<peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tglx@linutronix.de>, <yury.norov@gmail.com>,
	<maddy@linux.ibm.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <gregkh@linuxfoundation.org>
CC: <vschneid@redhat.com>, <iii@linux.ibm.com>, <huschle@linux.ibm.com>,
	<rostedt@goodmis.org>, <dietmar.eggemann@arm.com>, <vineeth@bitbyteword.org>,
	<jgross@suse.com>, <pbonzini@redhat.com>, <seanjc@google.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-5-sshegde@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250910174210.1969750-5-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: f69456b7-7fda-431d-f78a-08ddf0f25826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0h3UjlFUkhMZTUwMHhSaXNjSTZPcm5BdWxSZTcveFlRNXFmZUlFcjhwbzNT?=
 =?utf-8?B?Q3ZLcmZueXp4UTJncS8zNENZWTFLN3ZsUnNiMmZMOHBkT1dmRXpWTVA0V015?=
 =?utf-8?B?N1VVVVNiU3ZzSjRhcmxnQ1JEd09nOFJMTTJjWW02OHFJckR3QU5GZVlHS0Vt?=
 =?utf-8?B?NWg0L09YRm03ZjZaeGdVTUxjdmhSd1NlZ2JHdW91dERYL0NGUXNncmplQTJr?=
 =?utf-8?B?RkNQT2Flbjh4UkxXN1RRR3JyOHpsMHQ2VmEvdUFTWEpYZnBObjl2VzRsYWNl?=
 =?utf-8?B?VjRxMFNWUEFhOThkQU90aG9YOG53TkxkdjBhbnRtdkZlWjNPRjJUYlFlYWFq?=
 =?utf-8?B?clJQdnNacVB1VWJOZnZRT0VubFAxUm5aQVEvTU1jTDZoQlN3UFNLc1BTYVJW?=
 =?utf-8?B?TFh1M281bWZmMW5UMUNtU1lHQVhCaDdzaXMyR0xCZmN2WGsydndiL01oR05L?=
 =?utf-8?B?U0FXUlV1SXpHQW1hbVBuRjBzNUR4RzZQbSs0N2YwUGNVcmIwOGxZWG1IemFj?=
 =?utf-8?B?SjArMjRzdG5VUnBUSHkyaklFU0xHK0NmWXBlUkdHWENEVUhiQ1pzZEMyR2Rx?=
 =?utf-8?B?S3FpUWZaM2NRdWtsY3lmMGV5S1RnUUJhUmVXMElSMzhzTmlaa3p3VExJaGE0?=
 =?utf-8?B?M3YzVXAvOEFvNzJHQ3JiYnNRdXlHTzVibDhTV3diYXJZUzByUEtDK0lBUFBr?=
 =?utf-8?B?QVkvZzVSTTBXc2xsRkR0NEhxa0F5cWEzM0l6MnZHUXgyNVluNnRWNUFvS0Y0?=
 =?utf-8?B?Y2swcXRycFdYdlRjMWlzNHg5RllRWGlRUUo2QVk5aFJEc2xReHNRL0lXQkd0?=
 =?utf-8?B?cVJyaVpFQUVDcUpYWjMwakdpc0NQRTVVM3Q4aElIaUtqRzRpWWhyc0xILzZi?=
 =?utf-8?B?MEorbFI1clBML0oxRkJ2NU1EQ1gyMERqU21oTThKNXZybmtIejB4RFJobXBJ?=
 =?utf-8?B?Tk1EbmJFNEUwOU1EMDlkYXZGSFZ2cWw3T0ZsSFh0LzVrYmRFSW8yelVQRUpP?=
 =?utf-8?B?MVNIRk43eHpFQjdyZGdQWThHQWlWeGUzZENNZVd2Sm4rbTFIWWNrNmpTTk9L?=
 =?utf-8?B?UExFUlVTN0ZVdEw0N2cxUUtaWkloY1hKZzJpVjNZelpYMTR5NUxjNUpOUG9x?=
 =?utf-8?B?TTU2a3RUVDlrTG5zcHZvS0JuNGJRd0RlTHFRKzBaS2lnZEFtMzlmN0J4ZmJX?=
 =?utf-8?B?NHdkekFLRlJGdFJGWGlGN1AyS2JVSEZmUzhlL1lXV3BMbjAvTWZkTmwyaGw0?=
 =?utf-8?B?OXJqVnA0ejYxbzBFK0ZGR1NuZkpzUlBqQ0pGb0FQbGFoQUh6MkpySFhvZXpX?=
 =?utf-8?B?SnBxbXRZZmptd1N2MUQ1bEkzYjVxOWgwWkNsVjh6TDB6UmFMNGtPZENqcndy?=
 =?utf-8?B?YS9wNmhtOTRMSHRCMmdhN2N3T2JaODZuYkpnZHVHRTJhV3BveU5kc2daMlJO?=
 =?utf-8?B?eUt6S3RBelZBczNKcDJyd3FNZmlUWEtSSzBCQURTZTBZZWFkSmxPZ0htMEVq?=
 =?utf-8?B?R3c0QThOai9ZbytjMzFadkJRU1BhVStnazFQdEIzWWtLT0VUYkpheDQ5bFd1?=
 =?utf-8?B?ek9oUERVRzZ1L2M2V3pLMi9vanNpbU5URE1mMXZmRG5xbEJTRzZVd2NUUXZH?=
 =?utf-8?B?RFA5eHFYNVVaa0J0ZmJXMUl2VS9xRGNLVFlYdVo3ZWQwd0V1bWc4SG1sYmVP?=
 =?utf-8?B?ejE5em9ibXpzSWRoUHpoNkNjZGxqYm5mdmNUMTNPak93RUlraDY4aXQxK0pZ?=
 =?utf-8?B?N292M1c0U3d1Tk9PWkcxY0tFcExPYzZmeHhTT1E5RXMya1JISkpmRjlEQVFC?=
 =?utf-8?B?Mm5Md2ZpMHZPTE43U1EzVDg0dmorcXhqZTRnWnhwT3FBaVVEemU2M2R2UkZh?=
 =?utf-8?B?MUswaHR3M1FXVVZuVmY1d3hFUy9jazAxS28wblNNYTFKWUQwbXZzWG1Mb2Fv?=
 =?utf-8?B?dXF1QncvYmFpODh4OTNwYmwrVHViOGNqTFRwQmUzR1I5Qm9VNCtJTEYzSmtR?=
 =?utf-8?B?MmM2ejVkeEZFVWIxcHRCN0F2Z2hGSkVLaDRiWmVENThOeURBdUJJWnhpa0xC?=
 =?utf-8?B?NjNZMmwwUGVyT0R6blJsRGt2Zk1BVzVmaXRqdz09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 05:16:20.7305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69456b7-7fda-431d-f78a-08ddf0f25826
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shrikanth,

On 9/10/2025 11:12 PM, Shrikanth Hegde wrote:
> @@ -2462,8 +2462,13 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  		return cpu_online(cpu);
>  
>  	/* Non kernel threads are not allowed during either online or offline. */
> -	if (!(p->flags & PF_KTHREAD))
> -		return cpu_active(cpu);
> +	if (!(p->flags & PF_KTHREAD)) {
> +		/* A user thread shouldn't be allowed on a paravirt cpu */
> +		if (is_cpu_paravirt(cpu))
> +			return false;
> +		else

nit. redundant "else". I think this can be simplified as:

    return !is_cpu_paravirt(cpu) && cpu_active(cpu);

> +			return cpu_active(cpu);
> +	}

-- 
Thanks and Regards,
Prateek


