Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A42212C94
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:55:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yS383C5NzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=skU5G1aD; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRyr6y1FzDq97
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:51:48 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id l6so9724816pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SzSS54e5bq1IFnXIIvO4DspIsZygQN1CJ03qjOV/T6I=;
 b=skU5G1aDBzVI2snI8XGozUM7qQgxSd7izAiIeccwo4I7Feqpn4pyqzAVSPUer3Hh9K
 ffAmWdo8GyUfJFsyP7cmkrrW7M1e2X+hUKPGrnAkFg8CAwC3gT9CSfTzHwSq1GKySJ0O
 vFMwTAdHDlGmu9ueRb4d+g+TqMhxaReiZkJXYFYUvAL8Wdi0Yo/sBMtddDC+7T/rWfA2
 v6wFmnA0WemapDZdoTwgnXs7cjFEKDjTyh8NYs6ojyToUh8XP0qfpYb4CGnspQG4EMLC
 qQje0LZHREcJ+w1lmTu1ZmCByBBdJDSai4Ig8RmibzE7Yi9BlTY+AZAZR5uijxh5Kaj8
 0fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SzSS54e5bq1IFnXIIvO4DspIsZygQN1CJ03qjOV/T6I=;
 b=hS0mm9Yp/3PjFBrh13tyzKzPcC5bxgWcVzOMxF6stAwdXCullz/ev7AiQLMg1Q3XL/
 09gxdvoH7Wv+nuTv/+87phy/Qenlm38VmIgXHwLe2EAifKMAnobZxSsre7W33y1NLjKO
 1aeYr5gNhfBMB0qIRFLP9ZO/nqiv1ZeJjj0EK+vKxgZSk4ZLuyEkmdtEK6OICiqkDw/2
 4XhRePm713R0Umvb+bnly73AGTBNXXxixh1OgASobYArEJpOWw6U4GqR/+2amJTSb9vJ
 gad8//v0nyr4M3uH7TCljpv7nl1B/DjtrCXxrE8B2r5PmGRpNT88xbRQCkdyKmPVn7Z3
 Uxhg==
X-Gm-Message-State: AOAM532V8ebftNPzeIqr0j7WZ4ci8aa7MGYAwjrBmUCkuXrwx7MCgWnh
 8J6OEBmtjdbtBzw5JB7xn7Y=
X-Google-Smtp-Source: ABdhPJwafFGUWpt7uEzkYfqLdRUfoFvIEPIx2vTSqVn++JfBTlcWmD7vrAtYfcS3N6QfDZ/QQ/XpWg==
X-Received: by 2002:a17:90a:dc09:: with SMTP id
 i9mr34272574pjv.122.1593715905957; 
 Thu, 02 Jul 2020 11:51:45 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id s10sm8949429pjl.41.2020.07.02.11.51.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:51:45 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:51:41 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 5/6] ASoC: fsl: fsl_asrc: fix kernel-doc
Message-ID: <20200702185141.GF23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-6-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-6-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 Fabio Estevam <festevam@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 12:22:26PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. fix kernel doc and describe arguments.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
