Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC377F04D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 07:46:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KNjaMq+i;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jRsC/3SY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRDXD3Cx8z3cSy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 15:46:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KNjaMq+i;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jRsC/3SY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=hare@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRDWN5tCFz2yW0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 15:45:52 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A82B41F895;
	Thu, 17 Aug 2023 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692251149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ybx2UjRN5K63ZivO4yR3n43B2OIui/ORZp64WM14s8g=;
	b=KNjaMq+ivyYiOLMTJOvgr1iLLadHsr7ix9dMlAJvM9xIz/1slfT0QDt7KnrdalK5Mll9fv
	n9hV8HaMblCsCLoAzqJdpaGyf8YXn/5pbgRKxgvF1B3VDON39Q3ngnjp2d6BH8pZfF/0Ky
	UBdWwF9NyXKQHl31+elpY4BnICKFhS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692251149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ybx2UjRN5K63ZivO4yR3n43B2OIui/ORZp64WM14s8g=;
	b=jRsC/3SYkZpHkFP7oTxiHs5YMeUoBVDmXUDmzUj/7UUN2hGbYyZf6qQhQ24qfnjO1BAZw/
	PL950fWyYk6bpaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6387513909;
	Thu, 17 Aug 2023 05:45:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ou3HEw203WRcCQAAMHmgww
	(envelope-from <hare@suse.de>); Thu, 17 Aug 2023 05:45:49 +0000
Message-ID: <14376b9c-2536-4826-0ecb-f926ab36d5f0@suse.de>
Date: Thu, 17 Aug 2023 07:45:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
Content-Language: en-US
To: gjoyce@linux.vnet.ibm.com, linux-block@vger.kernel.org
References: <20230721211949.3437598-1-gjoyce@linux.vnet.ibm.com>
 <20230721211949.3437598-4-gjoyce@linux.vnet.ibm.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230721211949.3437598-4-gjoyce@linux.vnet.ibm.com>
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, okozina@redhat.com, dkeefe@redhat.com, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/21/23 23:19, gjoyce@linux.vnet.ibm.com wrote:
> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> Define operations for SED Opal to read/write keys
> from POWER LPAR Platform KeyStore(PLPKS). This allows
> non-volatile storage of SED Opal keys.
> 
> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> ---
>   arch/powerpc/platforms/pseries/Kconfig        |   6 +
>   arch/powerpc/platforms/pseries/Makefile       |   1 +
>   .../powerpc/platforms/pseries/plpks_sed_ops.c | 114 ++++++++++++++++++
>   block/Kconfig                                 |   1 +
>   4 files changed, 122 insertions(+)
>   create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

