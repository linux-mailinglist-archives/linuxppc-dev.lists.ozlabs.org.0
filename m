Return-Path: <linuxppc-dev+bounces-13426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A7C13B07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 10:05:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwkxS3jY3z3dVl;
	Tue, 28 Oct 2025 20:05:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761642348;
	cv=none; b=LhFlIXut9w9kSCiuBBQp96WLSB8k1rk2eZbHIHRnbT/HWPngTpUEBYnywNN+fV5FxYgDuWLPve7IV8hEafEsC5fEf84L0XTAsMTRvILPU5uQ2Zptrld11acW4sRY5Wg3plUdE2zi87tsde2T7621x2dQmiiSIs9IFKAnEeCRnPUCGLdAuuUzt8LbOu1tg/wETBshatIXJ3OW9X0CkVL9XpnTlbbiuhd8hn+ysYCq0LSU49F/T0hJRPFXZn0VvEsErWni4WlrD5CkZ8Jr4wcgg14yuigLAgYqb5+FyWtwGqb1tnXd88JZLs3GGz8nkpljyFWLdCcTL1imgPepEuAbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761642348; c=relaxed/relaxed;
	bh=VYG1/RX+eliusqnCBd6U7J9LKVWeo4069gz4bEck/bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NF9R53CUj7fPg9Pen2usxI/RpqyeFbhDsfnBxkQavzzPV1NF5OPHYPqqJ1zMLRFdRV69Ne6HxiBkJJEHaIMAh0+Ra/7hVR0DwEpmXLwENLCjUYE8wXzH22MrtRvPnqRPw5Ul5TDids/BLPLRolJ0SiKIdWriL6Cnar4zFPMlTQ6QuohUkSRXAqrCIW6vpSAfESzm/Hko55Rxw79an1vnbU650/5bVUqol13VPcfUlxaqiisVVwBdRhQHUBAfBEf5SYSOILQGRgqfwH1PBTbFRLZHgUTUAN6Hj7p74nThVYJyNHtRzn7nA13Q9prmJPo9ysTulBP9FnOcNqTOtN8/Mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PZec/Lez; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PZec/Lez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwkxR2T53z3bfY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 20:05:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3107961D2C;
	Tue, 28 Oct 2025 09:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B71C4CEE7;
	Tue, 28 Oct 2025 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761642343;
	bh=K7A5LEXplzJkfbatI7862m7lOmxo9hUn+BBYMb0zq7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZec/LezMN2HA57TVdFf37v+PPHo/3Uoto2mBVGcWze/3hNKVlCb7PYXJVs3YNupN
	 pyndNNhHD/RoU7+mn0gX0mv53jhremANWz5BQkh4M8PvOOj2/3ifonoe4IqN0K0zi2
	 DAubPAv4WvADNnAXm09I1n3+c8kTGsA1cpQ7JrOI=
Date: Tue, 28 Oct 2025 09:47:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 36/50] functionfs: switch to simple_remove_by_name()
Message-ID: <2025102848-freewill-atrium-ea47@gregkh>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-37-viro@zeniv.linux.org.uk>
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
In-Reply-To: <20251028004614.393374-37-viro@zeniv.linux.org.uk>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 12:45:55AM +0000, Al Viro wrote:
> No need to return dentry from ffs_sb_create_file() or keep it around
> afterwards.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

