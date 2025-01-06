Return-Path: <linuxppc-dev+bounces-4686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C477A01F19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 07:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRNyp54WDz304l;
	Mon,  6 Jan 2025 17:08:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736143698;
	cv=none; b=mNrYLeI0xpkzItYr6Y+CPJzmqJyuvUwC5J8HiOzcAiCY9gKsDeDJXTvVM0GpgGs1WU7c5omEn7fM/SSouh0R25qYz7nEPsv/L4R8XbqXkDGh9XGjlNvCadP4WS/+W/9T7c6UZ5SmQ5RxM3KykZgXwMIyfgjm8KJ4zpEft3do5NrQfp6R6t3t+eH+o8SR5/GCBckExKIcfMIE0KKo79kVLmUJ5AMMqgkkZjujZxElrjMpKG7HQdREi+mqLxXyRQqdf6g1k2pFY5k6dxFI2z5LOwLR8DuniZO0srFDuSDhUQaBU4WBrjubfuOBc6Rme7xq715v7ZJ7BLy/OK279xm2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736143698; c=relaxed/relaxed;
	bh=ECj6xbOSydsrQ0h3y60hbN6oNhcXb1gzQeH/Gov1IA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkhHlBn5xlPkatVdOeTeQV23HJVjC/jThQaefVNe3KoNFKpxCYdjBd+09AY+oGKSthLfvrA4RvTcb2a7oAEj43wIKECjSusr87GPTmx6WKxdGXHBkuVShK/YrDs6ITNLo9RYosBExXNLmxOcCcUod+vULOrAN0zDrXXC0pIphwHugjbEqNMEKpJbTTrc9auBQ77WqtfCPu5o8EjO6IBcBNId7Vbau6aIt9bM80rrUPaVaIO3FplgJTw44DSsheWo0SnhKkqnfya5APhd4MiUBbAv7PlXJKNux11r+BPUVRtUcpqfvsvhiPGI/fRS5ztDdTzh7jcmZv9OBYDoy+f/3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6OjLpL9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BxMP5BCX; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6OjLpL9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BxMP5BCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRNyn3N6hz2xy2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 17:08:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736143690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ECj6xbOSydsrQ0h3y60hbN6oNhcXb1gzQeH/Gov1IA4=;
	b=h6OjLpL9On7mA4dmZML5pvg6ZDSEjpiC8MM7rIQf0Esc7Iz8bfJHbNDVXbNXRnv6quuIBj
	pkN0mkz4rRCUteHuJqvprT9vfVP31W9dNZ0QM0gGfVWmz44A9ktVENbH5HgYPSDpeHRoMu
	IVnZ2RK6RdTQigCnEzHD4zELGYoav7E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736143692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ECj6xbOSydsrQ0h3y60hbN6oNhcXb1gzQeH/Gov1IA4=;
	b=BxMP5BCXvtpggeXAcWeUgZnQsYY8kNBm4q7otz+ze5xJsQTCuXNHxI6ld32YGaYRJBYQ5y
	0kztr3mwwEXXzuL0Ik+1vVrKZZLekwWLj9cAJ9pfrOHNOcwFswtM1CiF8W8Mj3EDOTDkkd
	JAKZoBAmAUKVA4CuB4Au8Fz5gK+jXPU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-260-jEM1C5x0O9uGyYUyawzKbA-1; Mon,
 06 Jan 2025 01:08:07 -0500
X-MC-Unique: jEM1C5x0O9uGyYUyawzKbA-1
X-Mimecast-MFC-AGG-ID: jEM1C5x0O9uGyYUyawzKbA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A94B91956057;
	Mon,  6 Jan 2025 06:08:04 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 439E5195605F;
	Mon,  6 Jan 2025 06:08:01 +0000 (UTC)
Date: Mon, 6 Jan 2025 14:07:57 +0800
From: Baoquan He <bhe@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, devel@daynix.com
Subject: Re: [PATCH v2 0/5] elf: Define note name macros
Message-ID: <Z3tzPXorz6hzkvy/@MiWiFi-R3L-srv>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/04/25 at 11:38pm, Akihiko Odaki wrote:
> elf.h had a comment saying:
> > Notes used in ET_CORE. Architectures export some of the arch register
> > sets using the corresponding note types via the PTRACE_GETREGSET and
> > PTRACE_SETREGSET requests.
> > The note name for these types is "LINUX", except NT_PRFPREG that is
> > named "CORE".
> 
> However, NT_PRSTATUS is also named "CORE". It is also unclear what
> "these types" refers to.
> 
> To fix these problems, define a name for each note type. The added
> definitions are macros so the kernel and userspace can directly refer to
> them.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
> Changes in v2:
> - Added a macro definition for each note type instead of trying to
>   describe in a comment.
> - Link to v1: https://lore.kernel.org/r/20241225-elf-v1-1-79e940350d50@daynix.com

The entire patchset looks good to me, thx.

Acked-by: Baoquan He <bhe@redhat.com>


