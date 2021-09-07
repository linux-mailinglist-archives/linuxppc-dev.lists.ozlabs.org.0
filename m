Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF74026E2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 12:11:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3gyg0GHcz2yPm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 20:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=Soz1egwh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=Soz1egwh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=194.104.111.102;
 helo=de-smtp-delivery-102.mimecast.com; envelope-from=jbeulich@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=mimecast20200619 header.b=Soz1egwh; 
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=mimecast20200619 header.b=Soz1egwh; 
 dkim-atps=neutral
X-Greylist: delayed 62 seconds by postgrey-1.36 at boromir;
 Tue, 07 Sep 2021 20:10:24 AEST
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3gxr3lQ7z2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 20:10:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631009421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+hISsxpZ+6AAFYh011f4JZGbH+OhXY7HGys8HSC9dI=;
 b=Soz1egwhiiEi3TWcR/5fThZh2goFlKQ0M8cNj1W/z7/3LxqoH+1dXzwK/aiiYKiL2HE5O/
 8F+2pCKAj98CKb9e7Szj8DlBxuDDJiXGQFCSR4uhijZBbEPepIXcxv5gyFcwSb3kc1e1T+
 8EpGXoqoVs4NjVkvUW98aON2yOBRf70=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631009421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+hISsxpZ+6AAFYh011f4JZGbH+OhXY7HGys8HSC9dI=;
 b=Soz1egwhiiEi3TWcR/5fThZh2goFlKQ0M8cNj1W/z7/3LxqoH+1dXzwK/aiiYKiL2HE5O/
 8F+2pCKAj98CKb9e7Szj8DlBxuDDJiXGQFCSR4uhijZBbEPepIXcxv5gyFcwSb3kc1e1T+
 8EpGXoqoVs4NjVkvUW98aON2yOBRf70=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-cUzVwyWJPzyir_PQMp-iAQ-1; Tue, 07 Sep 2021 12:10:19 +0200
X-MC-Unique: cUzVwyWJPzyir_PQMp-iAQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATFnLEMuoUG33dBh1EVkgXLpr+UCKxnv1vD02ZkkTC5KwfeB5CIuywm/qLzMqpgZKMV3+SA6XX6R7s+8uCdfhv5MyKLawL2/8I+R6KQn1kjRXyopwXVecRe8AYBLIFzzjmTWUBNVCqPFDIEHBsP23qGpV0Jxd4Tbd7jEou+r6Hols9IEiGOinpFEA6xPnoS4qrObp8CraAW3NpDFAofTV2/Jk7CS7bnfHcVDjf02yCM5AhmGPrNEor3TmPP2DIvb/rKamOFl73ZR8cDfBKvPdIAJ3M06Wsrmq2SpPZK0V5KC4T6ymnpKAZqMb+GcWHNThgZJpmASHvOPl+qJMbN13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=o+hISsxpZ+6AAFYh011f4JZGbH+OhXY7HGys8HSC9dI=;
 b=gIRBzsqqtWU+N/GewJ1zbE/5dd1xgfelPJp2zbkITX8nu/GdEKkFppfiTWRE6GnR/Zuvpq43fgR1Ddcx2i5PrXAj0lXqzKEkyPnNOAdR1FcMwlUkvxdeWB/F/a7p6QQFpSWwoTa5A1KigGiuO7Wd7OQctW8tGZ7xjjUvPlFOnwfrWuT6c3GY1yWdeccK/Njzy2Rg54rtBFFwz/ExlzY7k4EOGWjuJv+qfFhKSLDzo5aA/lXFK8LCdwgKZl0ShB7vNJjqIMl4OVZxNsvKxVkrDJrhe7KhLyRhod1zpoCOFEyA0hE4dd7oVwtI0fTP7/oZH8zSNOdzvkZIDvkOMZB4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 10:10:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:10:18 +0000
Subject: [PATCH 5/9] xen/x86: make "earlyprintk=xen" work for HVM/PVH DomU
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <5e9ff16e-85f0-50ea-f053-37e17351a0cc@suse.com>
Date: Tue, 7 Sep 2021 12:10:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0116.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR10CA0116.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 10:10:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd14d20f-e8ea-4892-7b34-08d971e7b1ea
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB61768E9D1E00D85C93BBDCC0B3D39@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 52TajtVU4F2tne9oH5kEP8osFd5bqWVTP7F8f3qxwejC1BxWxsF76FC++gQxUqHfO3hx2QQGN2RQW/KclcmZoXyC2fqx3ye/XH5U3QRiTh/C/odpud+qdyeyLDOZzib1Q9A0Hm96Ln4ehWK5hyR7SPQ33nxqKPaTx7bpHzLUO+tO3YBIVgxiwgJ35Sm3RWnTpvFBxFfpO++e8u1/MZziSUATICuYtDZ8arFn2mVF3KjSdEUM9z+Iji9iecXhN5WJ5rk01sgGeaE4phWf2vKAOzrrlrx+6CJpWmJr64AVwbwId12uU1RoyqXWSvnuPIISFwrcY+GNTR63Q6D/a9LG1dZj3XRk13XbiDtrzy4pn6kAB+goqDJ3BuMTyKO557TevmIKG7oRrTmVZs+2ZHeOdptHX3n2xA0atw09NP+OpVqMcIYuGcvxZwbGfZUx2azxv6wu2tVZFOiRPZAMuwqaM5rCQ9mDlI356bOVDc6MSatftE4yo8+W/w2TfJdYQU3Bl14DoOhp5x9C9BySPgJ5o6/8LCB1IUSo3eD1OZhdexHUlrndUUiIEMKBdi0v0ILS0dxVI5RDPs/lKHdg9WtsYgWLXDW96Qg+KA2qkewfp1hb1oYHh3Oe0rCzgygPTmDzdWrDn3D6c5Slfuhp7byXdRXQoIk3NmXRBSAG/v3BWvAzDrpJSzloA9BRxUduZaOKvpRiMmcS+Kn3uNPeaz4FFBrZ75wBwA7g//+/UKYETvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5600.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(39860400002)(346002)(396003)(376002)(54906003)(66476007)(66556008)(2616005)(86362001)(8676002)(83380400001)(66946007)(4744005)(31696002)(956004)(26005)(38100700002)(6486002)(4326008)(8936002)(186003)(31686004)(36756003)(110136005)(316002)(478600001)(16576012)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MStORUI5eDFRY0lZWTRhT21VY3ZkMDM1d0RzaHRFUk8yaGRscEp0NW5TdzZJ?=
 =?utf-8?B?U2tQNk9UWHM3MFA1ZmNRL2J6S3kzdk16Y0tnamkxUnJWMkEvSGlNSzVNZVRj?=
 =?utf-8?B?Uy9PZDdndnJ5cktCYUQwODRraWN3WnlzYmVBaHl4TEhyWEJianBGMmxpd1ZJ?=
 =?utf-8?B?UlRUNUo5TllxSmRpYVlibzhINnRKeE5PMUE3RmRRTmpVUlB6a0VRMEo3WmtW?=
 =?utf-8?B?a2RIb3M4N294UEQ4QnBDRGx0T3VzbjVTeGp2MGI5MXBrU2svWXdSdCt0Nlg3?=
 =?utf-8?B?S01TV1NpaGQ1eVMxSkJEbjZCN25TVHRHbWY1ZVVFRnJCSWFaR3BJYTdlbEtK?=
 =?utf-8?B?bTdHb2ZUNTFNVkY1cmtGRFl5dGJqQ21XRlRTTGU5bnF2Q1VCSmcyM0JCcy8v?=
 =?utf-8?B?MEV2bW1CLzJLZmtCQVZ1ejVubVBsV3RHWDNOWDBISkM1TmZSSkdyRnpDSDNu?=
 =?utf-8?B?Njh6RnprK2tGdEIxT1FJY2xYb0VTa0lCVmxUYU9GMndSbmlyTEFaM29PVFNH?=
 =?utf-8?B?VTZDb2VteFk1bDFRclZNSENROHpHVWwxVHhmSStNK0RWOElXY3V0amF6OWYw?=
 =?utf-8?B?NVdmRWlQRGpPMWZ0YVgxRkUzOW43eTJLRERsdlNqNXp4dEVWM2hwVFQyZUps?=
 =?utf-8?B?R3d6UkpQWWM4U0pJbDhHSkkyTGZBOTJjWWNhdlYvS29yTUVDaHZhS2E3Q3Rs?=
 =?utf-8?B?eFlCM2phRHVqTVhZYzlPaWVsWTMvY21QL0hHc0dVSXpHT2ZTbS9wamJXMk4z?=
 =?utf-8?B?V2VsaDN4aUFWLzBNWW5Ic1pjMlN6QWpNZ1FPamxYU1RFMEgvSUxsMElQOFdR?=
 =?utf-8?B?aDhqdVZ3OGUxSHdHOThsQkRFKzFmdmRWOXNGZUtIZVZxM3FVVlR1a01wT25r?=
 =?utf-8?B?Q2QrQnovRERYQnpxMkFlRnplZ21QdVFHSEJsNmZINVBFSVhzSVJoaVRoVVdo?=
 =?utf-8?B?aVNSRlZBdXFXc1Y1bzh0SE5jNjF2UGtLUmJYeFJNWDFNK3U3b3QrTHNudWd5?=
 =?utf-8?B?eVZrWHFvVE1uNkxzcUZCalVzUjRBWVFXZXREN1NmRXRKeGdFNDRHdjBZOXdK?=
 =?utf-8?B?ZHhOZlJzV1dSVHNoVURQYkZQUG02aC9scGJwMWE5RkZvNGkyVVU1a24zQjUv?=
 =?utf-8?B?dXE2b2pCL01JKy96RytPbHJJcmZyVDB5a2lyRDRDeDNtL1JnMm9SRjlLWmdH?=
 =?utf-8?B?eEMwWXZ0UGYvTE8yRjN1QVhDTWp1TWYrNHMzRGhTTEsrSGZZUElXNks0eXJ0?=
 =?utf-8?B?UktUN1JzTWF1T1VBRk9udWhrbnhGZHN3U2IwZFBKbUdUMjE5RXFrRkpXSUN4?=
 =?utf-8?B?Z000b04waUsraHVtdjZ0eWUySGVTc3dYc2JFMUNLOGN1OEZIYm9PSUxFWFI2?=
 =?utf-8?B?VG5wZVFIdHFkLzExeHJzc1BQT25kc1BrbCszV3dwY1JGaWp4bFVaZDcyTmhD?=
 =?utf-8?B?NkZSV1BSMmh5Y0NGR1EvWlQybittbUhKdHc2RVdqT002dUhzbG12VWhpZlda?=
 =?utf-8?B?UEtYdUhVdXkwdlhzVkI4UEJ5eEpPYU1jcDRJOXlwZUhDbFhoaXRKZVlWWTVB?=
 =?utf-8?B?dmpYT1pINTlNajdhcm5Jc3djdU50M1V0ekwrU0h2d1dtNCsvUTZDN1RaOXlv?=
 =?utf-8?B?Z3ljSzBHM0RzTjh5S1dxL1ZweVphOGVBSmkrSXNEbFdsUE5jSG1rMS9McWY0?=
 =?utf-8?B?WW10cVBzZjRqTzA3SFY4T0lHVU1ZVngweFBmMDJ4Q2puYjhEVmhCQ0czNHdQ?=
 =?utf-8?Q?1tPC7FKAW3V1NHHKwVhQsdtEBaB7iwM+9hizwPn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd14d20f-e8ea-4892-7b34-08d971e7b1ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:10:18.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBWJ29EHAWW9qhp7K5EU/e3Iy/v4j9mjWX/wsY6QoUje96WZfw6EMlvcnIltHJy6I1tkkKx0FPt4ZaVC4ylsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

xenboot_write_console() is dealing with these quite fine so I don't see
why xenboot_console_setup() would return -ENOENT in this case.

Adjust documentation accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1266,7 +1266,7 @@
 			The VGA and EFI output is eventually overwritten by
 			the real console.
 
-			The xen output can only be used by Xen PV guests.
+			The xen option can only be used in Xen domains.
 
 			The sclp output can only be used on s390.
 
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -618,10 +618,8 @@ static int __init xenboot_console_setup(
 {
 	static struct xencons_info xenboot;
 
-	if (xen_initial_domain())
+	if (xen_initial_domain() || !xen_pv_domain())
 		return 0;
-	if (!xen_pv_domain())
-		return -ENODEV;
 
 	return xencons_info_pv_init(&xenboot, 0);
 }

