Return-Path: <linuxppc-dev+bounces-8417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D284AAE754
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 19:02:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt1lq1fDxz30Pg;
	Thu,  8 May 2025 03:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746637351;
	cv=none; b=hglXRpCwq/hSF3gVIgESongSEfXlr2ak8LJ1jX3F3uaaG9sL5NDkgq/up7g/pI5tQpdiO63U5HMm5Hbfznmroj4sIEVJBTDzK19prsPRcTHsFFdWLf3gxsajctHvtYrvzJp8DSlPY35U4VXW9ZBA9p8WdK4S/d6UNkTzYDuG1+xB6tOc9qVx6zCe6Jv5SVxAxaf9DArA6fpg6ymoIZqXuST93RbqwgTnEZ9JXd2dbf3boyyFOXtdktxDQeheUR2c4zLq3fipf9XrdyozgwOJAcjVBnJ+1y9A2mhMKKA1RILuHKtCZj45VSS4HK76u6qakmnb47By/iup+CXZ7DQu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746637351; c=relaxed/relaxed;
	bh=T+tEHxOg4LrHhAiwUntt+Jm92lVXU+WcP7W0pnjwGBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYld2PgERajdv2wqm/SJsT4Z7r/VkYEPcUZnluKvtdEJmQJKKttHygpDWyQwWdO8pdhEdc+9yYOpoKuKd8pTp85izAq8jjFqAn9bo0k35UUGoX1q+OkLklTWUWKPjL7pe9iHoUIrIaH9uJC7cgNbNKdlCKxDpWYVJ+TqIL5KyMd8lQI8tEdpTNWYoX7DO2rHZ0SffCmMauXR/mEXZ5XwmDcWNXB9q3if8dOYJIl5rSQ4/X0xsWXaP8ixvtYYMSk8Z4ZP0E1fXdwhrDvoftgwAzcpcB6xD3jNXzPn1w43Hq6ReLk41H/V5pLNI5D9rJ8pjf4aUxy8bX/MhEOH2Gfnpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=dsterba@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=dsterba@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt1lp09lMz30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 03:02:30 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB7211F441;
	Wed,  7 May 2025 17:02:23 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B48FA13882;
	Wed,  7 May 2025 17:02:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3ZzPKx+SG2h4AwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Wed, 07 May 2025 17:02:23 +0000
Date: Wed, 7 May 2025 19:02:22 +0200
From: David Sterba <dsterba@suse.cz>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-btrfs@vger.kernel.org, riteshh@linux.ibm.com,
	Qu Wenruo <quwenruo.btrfs@gmx.com>, disgoel@linux.vnet.ibm.com
Subject: Re: [next-20250506][btrfs] Kernel OOPS while btrfs/001 TC
Message-ID: <20250507170222.GJ9140@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <75b94ef2-752b-4018-9b2a-148ecda5e8f4@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75b94ef2-752b-4018-9b2a-148ecda5e8f4@linux.ibm.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DB7211F441
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 02:14:34PM +0530, Venkat Rao Bagalkote wrote:
> Hello,
> 
> 
> I am observing kernel OOPS, while running btrfs/001 TC, from xfstests suite.
> 
> 
> This issue is introduced in next-20250506. This issue is not seen on 
> next-20250505 kernel.

Thanks for the report, the patch has been removed from linux-next.

> [  968.074163] NIP [c00800000f7fb5e0] btrfs_get_tree_subvol+0x32c/0x544 > [btrfs]
> [  968.074205] LR [c00800000f7fb3b4] btrfs_get_tree_subvol+0x100/0x544 > [btrfs]
> [  968.074241] Call Trace:
> [  968.074244] [c000000154747bc0] [c00800000f7fb3b4] > btrfs_get_tree_subvol+0x100/0x544 [btrfs] (unreliable)

This was the open coded fc_mount(), v3 is in the mailinglist,
https://lore.kernel.org/linux-btrfs/20250506195826.GU2023217@ZenIV/T/#u

