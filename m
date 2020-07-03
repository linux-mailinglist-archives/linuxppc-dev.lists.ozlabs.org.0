Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 601862141D9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 00:56:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49z9L51c4yzDrLk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 08:55:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rADDYge1; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49z9JD51sszDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jul 2020 08:54:20 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id g67so14780823pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 15:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oTkXaid7GNQFlYsfEdaKgaeUOuBmaSvEjnjEuHkyUUU=;
 b=rADDYge1q8I0zarVOuiCP1n2dmRmYyBGsy/hzGn98BWsvhF+fO8UEnYF/uYevcnz9W
 nhrP4oB+QqHV1nMJQTc1184IqisHW25ctgVTsb+JHzofrZyC11+C15Ll30Ah09WMEYIp
 DwnIhEKb3aCFGX97TKlx3fhoKhL2RFZv3DzxdW4PQX1/PH02RtgRU70uLjhE3H89rPmV
 rvAPF/2FhpR35IR22Pn1jZ8fbAh5HxEvh87QKNbFxY3ZKqZrNVBAIUe+Zl4w2BKU/Yb0
 0DtcJRDKdjITgVWxDxZ1KNglRN59Gs5W+MJ+C2j2LfupwzOq3EFblegWmxzI+QFz0Tvs
 69Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oTkXaid7GNQFlYsfEdaKgaeUOuBmaSvEjnjEuHkyUUU=;
 b=Lc4HY8fjqybQOoi/JVJ+OHV+qntoqnxmjBoj6snJhlO5zlQblEzJN+1UBooM+kWKJE
 4oIk8Lc8tyAMk7WXPYCbOjAPIlmtJ01AwGAErT74XHRlD57VZLglK27Bc79GRDdJvfGH
 N0ETTcDAaswdIHGG62dNGoSiAao6UD1XpjHOGAJLHn50Xb06r7LTmrDwrqEReLkiHbeK
 FiyBz/K0/mkJHQCPilqJXfNhJSkQnqhtBe5CYwMMxbZoUqQ40/tbkDEqGoEzbgC8AL6S
 4R5flhxCdd01vitMJZHM2ItaxOfzlBiQWkw3xH7rWPZlPmNeAZstmherOwSeQWXljcuF
 reOQ==
X-Gm-Message-State: AOAM53352Qbq3CNRpQozJ56fEV7r3/Kf6ta+7tzv7jm3eI+045X55Cir
 yU5yaN0jJyqmA1W2uXNxd7M=
X-Google-Smtp-Source: ABdhPJzPGC57mpfLFULngr/NnF0Fhw5PfT+pcnDnv2cckFMj9UhDHYp/0lgx64qalRF9BLeG1Dnvhw==
X-Received: by 2002:a65:6447:: with SMTP id s7mr31250183pgv.320.1593816858307; 
 Fri, 03 Jul 2020 15:54:18 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id v8sm5633794pjf.46.2020.07.03.15.54.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jul 2020 15:54:17 -0700 (PDT)
Date: Fri, 3 Jul 2020 15:54:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703225408.GA16494@Asurada-Nvidia>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
 <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
 <20200703224656.GA16467@Asurada-Nvidia>
 <20200703225020.GB29047@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703225020.GB29047@sirena.org.uk>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 03, 2020 at 11:50:20PM +0100, Mark Brown wrote:
> On Fri, Jul 03, 2020 at 03:46:58PM -0700, Nicolin Chen wrote:
> 
> > > [1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
> > >       commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0
> 
> > You already applied v3 of this change:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/169976.html
> 
> > And it's already in linux-next also. Not sure what's happening...
> 
> The script can't always tell the difference between versions - it looks
> like it's notified for v2 based on seeing v3 in git.

OK..as long as no revert nor re-applying happens, we can ignore :)

Thanks
