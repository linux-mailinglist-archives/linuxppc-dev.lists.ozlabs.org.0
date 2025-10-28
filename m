Return-Path: <linuxppc-dev+bounces-13453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6544C157F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 16:36:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwvcg4z0Lz3c1T;
	Wed, 29 Oct 2025 02:36:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761665811;
	cv=none; b=NbUaSzi1FRZE6WqGrq6jtl/3n6v2rn0yw5bt4j6BH8flf8b0AL5J+iA4BoSlV6UmyhuhIWaqx1q7ckn7JQBaaTLM8jUm9gn7LwS4CioxyIxhmColycx28VofztNmpioItrTBPCrDPV3Pyga2cFZSGpLKrzo46gdmy2iTAqPxdfcvAlpsa85Aiway3Zc4Xm8J0lI51N9EMWIgGeQKiy2VEr++8ASj55g8eR3Uf9SiMPhT+HJh7ThJLh2jAvOTSRuA5dFuxLR7Y8pkDxVILJ9vLIKBiObUWX7XNc4KzxByEq+wFNZfOBcCbHndAL3V6/wgIHrnlEIwkaBynbRs+SQhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761665811; c=relaxed/relaxed;
	bh=Dn+J543PaE9pTtS4VYTKUNcdwvzPCZNgqy59cfgNWrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLdHM/KO6ietxMd/+LS12FekaztPhhWt0sUBdaHvEL72rETdJSptvDvMKae4MxsQyKcV2msUBjn9+DKFYZKTga6THHk58olJo5IpSC5qaVd7Qt7b+BtevegDeqe16boqrgsJutmzd8x9v/4xLAaYhtBaCRt0b3qp5Is9R/uZHoeJPzS9sbDV3LtuMKNe8uSBINMHYJHqKRfNPaguJNF06dPF2NvJq2XMwz+qgxeS5ruwBMkkyjLjwqkS7b+SGhKmTjykRG1mlowDKaPOc+pczDqa4wBqYJNwQivggyBDKpBVyIZ27ZabZZo2+Rn7raXsJEUMOvjefpA+ilCpI9wFoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwvcf4H39z3btx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 02:36:48 +1100 (AEDT)
Received: from omf08.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 3CD0C1404A9;
	Tue, 28 Oct 2025 15:36:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id A321A2002A;
	Tue, 28 Oct 2025 15:36:39 +0000 (UTC)
Date: Tue, 28 Oct 2025 11:37:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
 brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu,
 neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org,
 linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, paul@paul-moore.com,
 casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
 john.johansen@canonical.com, selinux@vger.kernel.org,
 borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 19/50] convert tracefs
Message-ID: <20251028113717.2154482d@gandalf.local.home>
In-Reply-To: <20251028004614.393374-20-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
	<20251028004614.393374-20-viro@zeniv.linux.org.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: f6bmgxhcefm7bwohfbwepa9p8cuixubt
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: A321A2002A
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+s7gR+r9niKNL07T0pO7ukE0upf2CD5vI=
X-HE-Tag: 1761665799-59606
X-HE-Meta: U2FsdGVkX19g0bbaz2RZh320ocW7TSQSsOT9nF8qHkd5qWlBifJ/KGtfmWtsv1mzJP9ht/c5mZRt/OtFwhvV0nurLgOmsL+MgJEwJdQoabvLgqWyyWgPOtUtslgD012XhVqixajC5WLifrc/mNIrsi899n45JcxWb92Q20WFBPjq9fbMnMjzm49UpPMD39et9NXHIuTp+8ue8LHJcfY24Tb39Ouk2tY7I25w4L+/k2xiNhHBjQibW0Hpw7CZthMHcDOEtP04RbMR+7OcgsAvcilq3cwXqyvP6wxxoNA77oyga0E0P4NCRNz/Jj7XTabrxjt2M47rWHelMrTtE3Ho2LOneBwKq0YQxYsBKf09n05la3UZdYBsNJsEB3vTPECvtqDSIEN0Vv1VQdzkGQVHiqH5dArBachPtpebDDmuJAfLPjsP32VD10VFGrg/VDlo
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 00:45:38 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> A mix of persistent and non-persistent dentries in there.  Strictly
> speaking, no need for kill_litter_super() anyway - it pins an internal
> mount whenever a persistent dentry is created, so at fs shutdown time
> there won't be any to deal with.
> 
> However, let's make it explicit - replace d_instantiate() with
> d_make_persistent() + dput() (the latter in tracefs_end_creating(),
> where it folds with inode_unlock() into simple_done_creating())
> for dentries we want persistent and have d_make_discardable() done
> either by simple_recursive_removal() (used by tracefs_remove())
> or explicitly in eventfs_remove_events_dir().
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

I ran the tracing selftests and some other tests I have against this and
nothing interesting happened. I didn't run my full test suite, but it looks
sane to me.

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

