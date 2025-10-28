Return-Path: <linuxppc-dev+bounces-13413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6658C1286B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 02:22:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwXfT4jr2z3fpV;
	Tue, 28 Oct 2025 12:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761614529;
	cv=none; b=Heo48zQ3LPbf1+vNaxMpWp9CKUCmAICCg5UFVsMoLb4oabTnco7oHFm6vdVyj0U72cPt6EjMIIMLgoTmVQZJF1dk6arPxOvE7f093g3zJkTzfQCAgSvwxOy9ySIQ2mxx3JomtO2ZLmnsoeLgnUr402y61tWmq71xHEajk3ECvYsKSBXb+6qriF6m7TL0kgT+6aD7ArLV6YUm1CmJDetUFEXCMSyvt+LGlHTCFEc3r3cCVk55fJPctOPOQKrVQVG0EG2iUm2El/6k4asGo6weAJYREJWBQ19SddWggjM015fNgEgMnMe+6SziUVy9LsFcVN/H8gsblBWZA8pZvukZXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761614529; c=relaxed/relaxed;
	bh=zAtvblnyhJ9Yl46nm7hwWBBHx0i4EpLuxlHngY/39qo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7xtpasgdLyq1y7mFqsiMgk6u/cNgGQrpM99puWGPS83Ms/mvMfhioyyB9FmamczbJBO9jxfki0CXs1HLyxdLETfw/czIqTjtEOeVfYVn8O1ros2PLmrBJ5NRGZACn0z/7Jv12v3dTVlD70r7czhYI37uvl8KyZbFTvNyLHx1qhaKHuk0/NggpYSyLiKBottE4mo4LqIFqe1drCllliVSh29piwPEYbqlyQvkfDIlAiZ3Lf5CBlqUlg8b9dKfNm46OLyLEBi+4XE7PLADXXSWF1DhwLLK0fH63yGODEF9FaiQ0Wd7KZksET6KdvU0c0zycRIJe8zsgONb71Fmzh+TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.10; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 447 seconds by postgrey-1.37 at boromir; Tue, 28 Oct 2025 12:22:03 AEDT
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwXfM6S5xz3fpS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 12:22:03 +1100 (AEDT)
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 12D8A12A5E4;
	Tue, 28 Oct 2025 01:14:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id B058135;
	Tue, 28 Oct 2025 01:14:24 +0000 (UTC)
Date: Mon, 27 Oct 2025 21:15:01 -0400
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
Subject: Re: [PATCH v2 02/50] tracefs: fix a leak in
 eventfs_create_events_dir()
Message-ID: <20251027211501.1ec4940c@gandalf.local.home>
In-Reply-To: <20251028004614.393374-3-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
	<20251028004614.393374-3-viro@zeniv.linux.org.uk>
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
X-Stat-Signature: emtbj1y1cju7g4shfpg13tdhnhs4nnwe
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: B058135
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19GTe7PKSAfAGlbt/zS4ZGC8rcOFjmyEK0=
X-HE-Tag: 1761614064-363610
X-HE-Meta: U2FsdGVkX1/G1h3gGfRooYvnXx3jiT0AwrBONfXuKy3eeIhUbLFRGxNdBXPDpG/5ncnLD2Wi5bI2V9h+KPnTFqly0Q7VErHQu2q25ySYnNUny7DQWnj8sQCkkGfdWbi/bua2gd1Vg0frbF65fQ9/rH9lMpLN/+yjp/Vvtw1+ic2u+9OP9IqIBCHUSVaRSxDQRiidgj30RK844jt+AK/UFlJ9gl7wzbw6jqw/OkARt4qz2ow1hPKmVkDosJyejXNCzHhjgqGnoD0TuFx88/ym7PrOpd+IGQq4/krEZ6R626JFHE2nA2hzR9aU7tXEvFNqkK/yNMiujAAkUAQ+eodxQUyFYdHjihtmjcWI+LhUwkQvR3fTh7c3F1AI5fHutu/+k5BuP5JJRzbLX4ISmbC6rhojJVMm7lNjNjOrSwZtVdzqO+33uq5OHXe7VMnZNZ5zUTeXJ7349odfYLfXhL1Dfg==
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 00:45:21 +0000
Al Viro <viro@zeniv.linux.org.uk> wrote:

> If we have LOCKDOWN_TRACEFS, the function bails out - *after*
> having locked the parent directory and without bothering to
> undo that.  Just check it before tracefs_start_creating()...
> 
> Fixes: e24709454c45 "tracefs/eventfs: Add missing lockdown checks"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/tracefs/event_inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

