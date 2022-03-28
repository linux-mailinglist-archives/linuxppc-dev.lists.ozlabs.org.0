Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C002A4EA27F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 23:36:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS5cS4pCfz3cBR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 08:36:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=bvQh4qsa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jjohnson@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=bvQh4qsa; dkim-atps=neutral
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir;
 Tue, 29 Mar 2022 03:19:51 AEDT
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRyZv6PKFz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 03:19:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648484392; x=1680020392;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Eu7nJy5jkPS6ql5ANPoXUckpfZ6g40U1vF2Yo2ODg4c=;
 b=bvQh4qsa3p4A3F2OVvNWOE0NcHJhsJePyRuvh5EyLQXEAg+yyiMFHP6B
 nB5GEekBK1EN6jLgpVIRB0CvX9x1sFAuQ2KxGQvryueiuK/xz4SiJ3dny
 rkux80TJXnu10GPb9zVHwKLtwrxTmV4HSiMGzA6U4rjW7rJcyPXAnaLdU w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Mar 2022 09:17:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 09:17:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 28 Mar 2022 09:17:44 -0700
Received: from [10.110.35.108] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 28 Mar
 2022 09:17:41 -0700
Message-ID: <f0ebc901-051a-c7fe-ca5a-bc798e7c31e7@quicinc.com>
Date: Mon, 28 Mar 2022 09:17:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 19/22] wnc36xx: Replace comments with C99 initializers
Content-Language: en-US
To: =?UTF-8?Q?Benjamin_St=c3=bcrz?= <benni@stuerz.xyz>, <andrew@lunn.ch>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-19-benni@stuerz.xyz>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220326165909.506926-19-benni@stuerz.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Tue, 29 Mar 2022 08:33:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 pkshih@realtek.com, linux-samsung-soc@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-edac@vger.kernel.org,
 dennis.dalessandro@cornelisnetworks.com, linux-rdma@vger.kernel.org,
 gregory.clement@bootlin.com, rafael.j.wysocki@intel.com, linux@armlinux.org.uk,
 krzk@kernel.org, jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com,
 linux-input@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 lenb@kernel.org, mike.marciniszyn@cornelisnetworks.com, rric@kernel.org,
 ajd@linux.ibm.com, arnd@arndb.de, kvalo@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 loic.poulain@linaro.org, bp@alien8.de, bhelgaas@google.com, tglx@linutronix.de,
 mchehab@kernel.org, linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/2022 9:59 AM, Benjamin Stürz wrote:
> This replaces comments with C99's designated
> initializers because the kernel supports them now.
> 
> Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
> ---
>   drivers/net/wireless/ath/wcn36xx/main.c | 122 ++++++++++++------------
>   1 file changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
> index 95ea7d040d8c..0fed64bd37b4 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -193,67 +193,67 @@ static inline u8 get_sta_index(struct ieee80211_vif *vif,
>   }
>   
>   static const char * const wcn36xx_caps_names[] = {
> -	"MCC",				/* 0 */
> -	"P2P",				/* 1 */
> -	"DOT11AC",			/* 2 */
> -	"SLM_SESSIONIZATION",		/* 3 */
> -	"DOT11AC_OPMODE",		/* 4 */
> -	"SAP32STA",			/* 5 */
> -	"TDLS",				/* 6 */
> -	"P2P_GO_NOA_DECOUPLE_INIT_SCAN",/* 7 */
> -	"WLANACTIVE_OFFLOAD",		/* 8 */
> -	"BEACON_OFFLOAD",		/* 9 */
> -	"SCAN_OFFLOAD",			/* 10 */
> -	"ROAM_OFFLOAD",			/* 11 */
> -	"BCN_MISS_OFFLOAD",		/* 12 */
> -	"STA_POWERSAVE",		/* 13 */
> -	"STA_ADVANCED_PWRSAVE",		/* 14 */
> -	"AP_UAPSD",			/* 15 */
> -	"AP_DFS",			/* 16 */
> -	"BLOCKACK",			/* 17 */
> -	"PHY_ERR",			/* 18 */
> -	"BCN_FILTER",			/* 19 */
> -	"RTT",				/* 20 */
> -	"RATECTRL",			/* 21 */
> -	"WOW",				/* 22 */
> -	"WLAN_ROAM_SCAN_OFFLOAD",	/* 23 */
> -	"SPECULATIVE_PS_POLL",		/* 24 */
> -	"SCAN_SCH",			/* 25 */
> -	"IBSS_HEARTBEAT_OFFLOAD",	/* 26 */
> -	"WLAN_SCAN_OFFLOAD",		/* 27 */
> -	"WLAN_PERIODIC_TX_PTRN",	/* 28 */
> -	"ADVANCE_TDLS",			/* 29 */
> -	"BATCH_SCAN",			/* 30 */
> -	"FW_IN_TX_PATH",		/* 31 */
> -	"EXTENDED_NSOFFLOAD_SLOT",	/* 32 */
> -	"CH_SWITCH_V1",			/* 33 */
> -	"HT40_OBSS_SCAN",		/* 34 */
> -	"UPDATE_CHANNEL_LIST",		/* 35 */
> -	"WLAN_MCADDR_FLT",		/* 36 */
> -	"WLAN_CH144",			/* 37 */
> -	"NAN",				/* 38 */
> -	"TDLS_SCAN_COEXISTENCE",	/* 39 */
> -	"LINK_LAYER_STATS_MEAS",	/* 40 */
> -	"MU_MIMO",			/* 41 */
> -	"EXTENDED_SCAN",		/* 42 */
> -	"DYNAMIC_WMM_PS",		/* 43 */
> -	"MAC_SPOOFED_SCAN",		/* 44 */
> -	"BMU_ERROR_GENERIC_RECOVERY",	/* 45 */
> -	"DISA",				/* 46 */
> -	"FW_STATS",			/* 47 */
> -	"WPS_PRBRSP_TMPL",		/* 48 */
> -	"BCN_IE_FLT_DELTA",		/* 49 */
> -	"TDLS_OFF_CHANNEL",		/* 51 */
> -	"RTT3",				/* 52 */
> -	"MGMT_FRAME_LOGGING",		/* 53 */
> -	"ENHANCED_TXBD_COMPLETION",	/* 54 */
> -	"LOGGING_ENHANCEMENT",		/* 55 */
> -	"EXT_SCAN_ENHANCED",		/* 56 */
> -	"MEMORY_DUMP_SUPPORTED",	/* 57 */
> -	"PER_PKT_STATS_SUPPORTED",	/* 58 */
> -	"EXT_LL_STAT",			/* 60 */
> -	"WIFI_CONFIG",			/* 61 */
> -	"ANTENNA_DIVERSITY_SELECTION",	/* 62 */
> +	[0]  = "MCC",
> +	[1]  = "P2P",
> +	[2]  = "DOT11AC",
> +	[3]  = "SLM_SESSIONIZATION",
> +	[4]  = "DOT11AC_OPMODE",
> +	[5]  = "SAP32STA",
> +	[6]  = "TDLS",
> +	[7]  = "P2P_GO_NOA_DECOUPLE_INIT_SCAN",
> +	[8]  = "WLANACTIVE_OFFLOAD",
> +	[9]  = "BEACON_OFFLOAD",
> +	[10] = "SCAN_OFFLOAD",
> +	[11] = "ROAM_OFFLOAD",
> +	[12] = "BCN_MISS_OFFLOAD",
> +	[13] = "STA_POWERSAVE",
> +	[14] = "STA_ADVANCED_PWRSAVE",
> +	[15] = "AP_UAPSD",
> +	[16] = "AP_DFS",
> +	[17] = "BLOCKACK",
> +	[18] = "PHY_ERR",
> +	[19] = "BCN_FILTER",
> +	[20] = "RTT",
> +	[21] = "RATECTRL",
> +	[22] = "WOW",
> +	[23] = "WLAN_ROAM_SCAN_OFFLOAD",
> +	[24] = "SPECULATIVE_PS_POLL",
> +	[25] = "SCAN_SCH",
> +	[26] = "IBSS_HEARTBEAT_OFFLOAD",
> +	[27] = "WLAN_SCAN_OFFLOAD",
> +	[28] = "WLAN_PERIODIC_TX_PTRN",
> +	[29] = "ADVANCE_TDLS",
> +	[30] = "BATCH_SCAN",
> +	[31] = "FW_IN_TX_PATH",
> +	[32] = "EXTENDED_NSOFFLOAD_SLOT",
> +	[33] = "CH_SWITCH_V1",
> +	[34] = "HT40_OBSS_SCAN",
> +	[35] = "UPDATE_CHANNEL_LIST",
> +	[36] = "WLAN_MCADDR_FLT",
> +	[37] = "WLAN_CH144",
> +	[38] = "NAN",
> +	[39] = "TDLS_SCAN_COEXISTENCE",
> +	[40] = "LINK_LAYER_STATS_MEAS",
> +	[41] = "MU_MIMO",
> +	[42] = "EXTENDED_SCAN",
> +	[43] = "DYNAMIC_WMM_PS",
> +	[44] = "MAC_SPOOFED_SCAN",
> +	[45] = "BMU_ERROR_GENERIC_RECOVERY",
> +	[46] = "DISA",
> +	[47] = "FW_STATS",
> +	[48] = "WPS_PRBRSP_TMPL",
> +	[49] = "BCN_IE_FLT_DELTA",
> +	[51] = "TDLS_OFF_CHANNEL",
> +	[52] = "RTT3",
> +	[53] = "MGMT_FRAME_LOGGING",
> +	[54] = "ENHANCED_TXBD_COMPLETION",
> +	[55] = "LOGGING_ENHANCEMENT",
> +	[56] = "EXT_SCAN_ENHANCED",
> +	[57] = "MEMORY_DUMP_SUPPORTED",
> +	[58] = "PER_PKT_STATS_SUPPORTED",
> +	[60] = "EXT_LL_STAT",
> +	[61] = "WIFI_CONFIG",
> +	[62] = "ANTENNA_DIVERSITY_SELECTION",
>   };
>   
>   static const char *wcn36xx_get_cap_name(enum place_holder_in_cap_bitmap x)

I know there has been much discussion on this series. For this specific 
patch this would be a great change if you use the actual enumerations 
from enum place_holder_in_cap_bitmap as the index values,
i.e.
  [MCC] = "MCC",
  etc.

So a v2 for this patch would be appreciated



