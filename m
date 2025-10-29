Return-Path: <linuxppc-dev+bounces-13480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B80C182B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 04:24:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxCK26K6kz3bfF;
	Wed, 29 Oct 2025 14:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761708262;
	cv=none; b=e/vF5vY4ju3rXBrsSD5Yx3yFZz4KrA9+eaoSf4Q+eQAO2l6PgYTNBgpa5w+vRBfk7d2WfNG6QrBmatf0tvimdqy0RMj9B5UAt/Q04U4ajBR0j7Dg73r4mIqHJ1g+mcXCjp1+0M+aNwniA/8NdpoaOL0Hk/pm3rjgz76HFJe45/P1mLdMZeM+CIQfT8NwKedIFMoxp2x2prfKM1Z4gtmq5+zQXErJudVnoojcZVRSufmjCelndqKdFiZ7h6Gt3LMWauV34niYiZlB2ilU8TjMdUlGM5bz70sLJpI664CAzRTBjFejr7Kp2GqfR3U8HK0mhbteq7Bp1/VgDfvieiOx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761708262; c=relaxed/relaxed;
	bh=/74EwcCNII2uB0u4CPJWojlcJa9JLtb0FVKMbO2Wykg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtGPWhboUwf6Ns6RzbVgitrZmoDV8EIA8z/6U84I/xi+POX7NV3XEhIABC6qiZlQdQI7vKfzEhY0cU8Hmk9mvKubjFnZ78ToPsu1qd3JbbHd9y00bVtH1awITfxvtmCFyeN6snhc24gQ3WZz+zrk3BMSilCeSrhzxFcMhrBcCHuizfbrL7o7qNKLQYMlTDlHWX+j3+ECVehKXD6m49N8CQjd/wA7gE1sqfKccjdXllAdICDBNJzPrMTbvewVmOcMC/DZFIatsrxh1rJTFUK52UMrj2U7bdCPflRqTasFU6rNw/kKZKR6VcseTM+/EjWcgXWT6OSdETtbdSMwuwAUJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=XcXd34Uj; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=XcXd34Uj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxCJz5B0bz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 14:24:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/74EwcCNII2uB0u4CPJWojlcJa9JLtb0FVKMbO2Wykg=; b=XcXd34Uj7enu+oskIPJPOtc2sW
	+JUVmiqxAcaM83jJ33Kj00wrrLLwo9mF6yh+svt4+qcE1PgJRBuN1EjWahP1tsM29WdL0OMW4u/zI
	wtsAkFC3DMZiEmRlreDEn6/IgmA37eL1BXSnR3JtjGswJcK3NCUEauvGde4K+59f8KsJEo6T5yKwq
	t4bKDSK3qMusrrsuHwPazN+I9d3szv/tBoGXBSjlJL/knw65vXnnJOFJhIz3yUjx4i5Ghlc/+rHgG
	7zcbEOG1Ix7lCoeZLSwiWl97ry3iG7ZT6wVMc9hHzyolLyGaE7QLp2JbVftwMF2LmmAKECmJ3Nj5R
	/es8Sg3A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDwn6-0000000DcBo-2Wtj;
	Wed, 29 Oct 2025 03:24:04 +0000
Date: Wed, 29 Oct 2025 03:24:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Paul Moore <paul@paul-moore.com>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 35/50] convert selinuxfs
Message-ID: <20251029032404.GQ2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-36-viro@zeniv.linux.org.uk>
 <CAHC9VhRQNmPZ3Sz496WPgQp-OkijiF7GgmHuR+=Kn3qBE6nj6Q@mail.gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhRQNmPZ3Sz496WPgQp-OkijiF7GgmHuR+=Kn3qBE6nj6Q@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 08:02:39PM -0400, Paul Moore wrote:

> I suppose the kill_litter_super()->kill_anon_super() should probably
> be pulled out into another patch as it's not really related to the
> d_make_persistent() change,

It very much is related - anything persistent left at ->kill_sb() time
will be taken out by generic_shutdown_super().  If all pinned objects
in there are marked persistent, kill_litter_super() becomes equivalent
to kill_anon_super() for that fs.

Sure, we can switch to kill_anon_super() in a separate later patch,
but conversion to d_make_persistent() will be a hard prereq for it.
No point splitting that one line, IMO...

