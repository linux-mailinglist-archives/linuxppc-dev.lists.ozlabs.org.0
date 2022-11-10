Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD9624886
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 18:45:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Tkh4DNnz3f5X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Nov 2022 04:45:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.174; helo=mail-pl1-f174.google.com; envelope-from=bart.vanassche@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Tk557psz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Nov 2022 04:44:43 +1100 (AEDT)
Received: by mail-pl1-f174.google.com with SMTP id io19so2019524plb.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 09:44:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwceInYzCobuvA+97AtreUei0+vT6Z12rofSZH5CYag=;
        b=MnP+BLHs+Wb726PyJpIERqY5edzQ0GCKlo1zFX7CZaIDbFL7NGQafdvlvVc/QEzkcN
         yFKMlSsgqhSw0rHA2n2UIfVMWRQoHlkHp9u/Y83PoD5eF5vuDbRoAAD5wbGGjVcvO4Qy
         bh6M9K3ZyjHF/v96aM2nPYeu071t1u5dzYsSNJZH9AyVPrwn9hDOQZwZee/eTGhpJgox
         wJyQrMHeMkELmzOP2ZJajrZkcts1QenUrtLt3LtxBiJkVumBSrs7B8rTKCoG1RhKiC8M
         T3RSimIc31ovUZfkchzULKy3ur+9W8MkVBTFywGzGLZ8jfYjB7D3nCH2023iVFawvK45
         SZtw==
X-Gm-Message-State: ACrzQf1yZvoC6lKaZC7kSSmWi0FeiRHIK4ljFhlF0xcPNH3uCTr59wAD
	ICNTE4SOfrTN7IkH01K4fmc=
X-Google-Smtp-Source: AMsMyM45goJ9HglQcd7yg+Y15isFuzi+L14lDds6gq0WcCBcb3B0WjOiO9I4KB/k0a0YK6hNZ5Mo2A==
X-Received: by 2002:a17:90a:4618:b0:214:100a:65cf with SMTP id w24-20020a17090a461800b00214100a65cfmr51674268pjg.118.1668102274562;
        Thu, 10 Nov 2022 09:44:34 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:2ecf:659:1c55:5? ([2620:15c:211:201:2ecf:659:1c55:5])
        by smtp.gmail.com with ESMTPSA id e19-20020a170902ed9300b00186acb14c4asm11506491plj.67.2022.11.10.09.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 09:44:29 -0800 (PST)
Message-ID: <05a91775-e4fa-4d70-8303-898339c4ea01@acm.org>
Date: Thu, 10 Nov 2022 09:44:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [6.1.0-rc4-next-20221109] Boot time warning
 kernel/module/main.c:852
To: Sachin Sant <sachinp@linux.ibm.com>, linux-scsi@vger.kernel.org
References: <06C70AFA-75C5-49A7-9EB4-27AF20A80EBB@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <06C70AFA-75C5-49A7-9EB4-27AF20A80EBB@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/10/22 00:01, Sachin Sant wrote:
> While booting 6.1.0-rc4-next-20221109 next kernel on a IBM Power9 LPAR
> following warning is seen:
> 
> [ 8.808868] ------------[ cut here ]------------
> [ 8.808872] WARNING: CPU: 1 PID: 378 at kernel/module/main.c:852 module_put+0x48/0x100
> [ 8.809024] sd 1:0:0:1: [sdc] Write cache: disabled, read cache: enabled, supports DPO and FUA
> [ 8.809024] LR [c0000000009ee680] scsi_device_put+0x50/0x70
> [ 8.809035] Call Trace:
> [ 8.809038] [c000000007c37b10] [c000000007c37b50] 0xc000000007c37b50 (unreliable)
> [ 8.809045] [c000000007c37b50] [c0000000009ee674] scsi_device_put+0x44/0x70
> [ 8.809053] [c000000007c37b80] [c000000000a10c70] alua_rtpg_work+0x210/0x920
> [ 8.809059] [c000000007c37c90] [c000000000182314] process_one_work+0x2b4/0x5b0
> [ 8.809066] [c000000007c37d30] [c000000000182688] worker_thread+0x78/0x600
> [ 8.809072] [c000000007c37dc0] [c00000000018f4f4] kthread+0x124/0x130
> [ 8.809079] [c000000007c37e10] [c00000000000cffc] ret_from_kernel_thread+0x5c/0x64
> [ 8.809086] Instruction dump:
> [ 8.809090] f821ffc1 41820034 395e03c0 7c0004ac 7d205028 2c090001 3929ffff 41c00010
> [ 8.809101] 7d20512d
> [ 8.809101] sd 1:0:0:1: [sdc] Preferred minimum I/O size 32768 bytes
> [ 8.809102] 40c2ffec 7c0004ac 79290fe2 <0b090000> 60000000 38210040 ebc1fff0
> [ 8.809115] ---[ end trace 0000000000000000 ]—
> 
> -next-20221108 was good. Git bisect points to following
> 
> commit 0b25e17e9018a0ea68a9f0b4787672e8c68fa8d5
> Date:   Mon Oct 31 15:47:25 2022 -0700
>      scsi: alua: Move a scsi_device_put() call out of alua_check_vpd()
> 
> Reverting this patch gets rid of the warning.

Hi Sachin,

Thanks for the detailed report. Does the patch below help?

diff --git a/drivers/scsi/device_handler/scsi_dh_alua.c b/drivers/scsi/device_handler/scsi_dh_alua.c
index 693cd827e138..d2cf15338724 100644
--- a/drivers/scsi/device_handler/scsi_dh_alua.c
+++ b/drivers/scsi/device_handler/scsi_dh_alua.c
@@ -1025,7 +1025,7 @@ static bool __must_check alua_rtpg_queue(struct alua_port_group *pg,
  			kref_put(&pg->kref, release_port_group);
  	}

-	return true;
+	return sdev != NULL;
  }

  /*

