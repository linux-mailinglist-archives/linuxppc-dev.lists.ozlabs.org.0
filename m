Return-Path: <linuxppc-dev+bounces-13513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C337C1B63B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 15:49:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxVWy1VS2z302b;
	Thu, 30 Oct 2025 01:49:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761749390;
	cv=none; b=Rzdj6/xEBC/IjraJP90bC99veTHWSyTd3X9utMlyjdzILwmD7bIgekdYo3WpSasuOiDVkgy1nT//Cb8EyMlWMxoUdjgCYieBPX9FQKaQ9tV25Bc5DLDpOhFQ60zm58CUFGafg4FXMANXq+GMbwqlzoYLD7ky+foqnf/mtqXpTa3P/FWUFLsDrlmUxHl/2vP7acL6vowhFZSUpEyLKHA0c9IfK94bjpl7q+xOVskfynkIQLXysWPxmH0DL8wmwa6+T/P8XYS+yZV+WwZErkRceNVpKinEYD1pyQa7rLeHAdmhajCGhHt/ehoqX7wj/b9KWdOy5XQSTlTH0lhArsRniA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761749390; c=relaxed/relaxed;
	bh=vsfcHn1joSx3FYcBHFCIU4wVQAcpbVHvkEyCsZn4M7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dha/8ZcqUgy4FLoKYtV0Y/BhINLSPfeBRSWoPPkwlFs1OBUS1v0mD93jf+mZ/Io/JGGP72KT3VKQlc5+AtJDXHror7dX+EC0pP4J1JrmOVKHlNWVW7ASF9Dy8iR5AMN5/NslGx4SoyNayfXgaaQGIpbw/gvT3hnw0tjOnRULPCiE9OAzaBUqfxVvIOJ7c5wxd/FG6a+WcOofo2ACWDScSK1LDl7xZwQOss0WjyEEg/QqpozjKlFurY2L910pVA0r40KQELv0sGwVg5DtGLkYAaOAU80+HEhPkGI/PLFbU8XeD+ZVtRTdValIlTpOQh0HFfbgzBlPEABbiMeDpEIAMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=fqC9fiEz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=fqC9fiEz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxVWx14Ywz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 01:49:48 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso13412a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761749386; x=1762354186; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsfcHn1joSx3FYcBHFCIU4wVQAcpbVHvkEyCsZn4M7g=;
        b=fqC9fiEzzSwlwk6wWa9lrK13hSzdbmC9N8Ml+hZ0eoWiDI9cY7zH9zJhfMfjb6WSAb
         n5TaRPD7BpWZHF+XWPHbn3rXZLfIJbGrsZvfeQl0x/so4C+2wme11g6JqkEw0RuKpkyx
         /7fEsuY5vP/IBT/5NyoTnNi23TACFT+0G+aSwL0raT5wkM9vZ9peIHz6jXbX6fCGs15M
         5+jduxAPWTwBCvCdCd7ttahADQt4HbG/gOO/kWPvq+7TOknH/FXzuaAD8rwIj9Ns/15b
         NdItJdstguboQe29IgH2cv7aUZ1Yzmxd80ZfMDbw7yWPaSwJ8OZW5cUrfiD0KXDjMPFI
         om9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749386; x=1762354186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsfcHn1joSx3FYcBHFCIU4wVQAcpbVHvkEyCsZn4M7g=;
        b=XZxDU1pp4s/Xav8YPXnlOlXhxYoGhZ4rQo5Ex75k1K5GtlevYqgdsmrffoQQqcdYFp
         7yiqfWiuGJNvgrM3ELqeEHAmT8sxQ0SXATaDRvaF7QktNEWgOKeHtZxc/RdbReKIA6mp
         tfc+1C0cAVvjOokIGHQxwbFB6vnURxBEwJH8ugrnzzmcAXJLMXmnBD/BicnqB1ZtMXzD
         TmhrcOV+clSmoHfRdcmOMObhrWfLVMpsGX1/uOPZUwXpg49kORutqSJBP0u3sy3dm5iv
         LDF/h9Qrukd6qeQttICN9hPxwBwm88+k1dAUgvk5CnWAVOJOGuBXmuyngzLtrYacEIE4
         VMvg==
X-Forwarded-Encrypted: i=1; AJvYcCXe4AkOmILifzOlDGmYnEyrKLw7hD6bp4zk1khmEA9uGOKfc34cx2IyBIKToNEyNDvRk8/Hm3FQjs+/Bq0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAqOlz0l/DhOrO61J/6sx+U20sxPKxjidy1lLzSsc/bMGsxGQi
	q2d7RlFrmZuXpzdeLCYSGe8aqLwgbZcDzsZ3/wGvKYVeaGl6HwHyxc7j0jP3tk94LdQHCqCK3hq
	mRLO9MWmAKx3QdA7XF/lTivDwXu8O34sT1jSq+Yn9
X-Gm-Gg: ASbGnctUuGSxsnbABFXVq0wrKYbU77EngDC66Kv/p27TtCuH4juf76L25nwHy19gn+n
	g/V0+hRLutyLTHXCNvezq2r5feNTEacbYrf6f+O4erUyIFIMRvC19goN/YizVqTXWo9eyqRcJA8
	39YXeJnx/VcPomfrg6LeSop/snG7ZEFCNpAUjAHg5nTagLiXcWOkFpGN7pb3N+NDj9IqajgAMp3
	0zIc0aSn2QjwlWTfF2c0EjGpEsOowUuuVwDnDUi/qsAH3Y3/9i8L70ibItp
X-Google-Smtp-Source: AGHT+IHiN2wVay8qKwNUCQNQedszNEqWD+gbH8QhJy+T+EtTl6Gz4GwA6YgaiehmmoZJBoAentF29nQI5J4sc3vsbuw=
X-Received: by 2002:a17:90a:d64d:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-3403a302f52mr3761415a91.36.1761749386246; Wed, 29 Oct 2025
 07:49:46 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-36-viro@zeniv.linux.org.uk> <CAHC9VhRQNmPZ3Sz496WPgQp-OkijiF7GgmHuR+=Kn3qBE6nj6Q@mail.gmail.com>
 <20251029032404.GQ2441659@ZenIV>
In-Reply-To: <20251029032404.GQ2441659@ZenIV>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 Oct 2025 10:49:34 -0400
X-Gm-Features: AWmQ_bkw5gzRbiAC20oxF8nOixccAI_lXABYmuYCSfnezye7FZYc2Gs15NqnG0I
Message-ID: <CAHC9VhRefx4MBDU78Qob7Pe2pDLK=1HK4b2EuTtENVssntHecQ@mail.gmail.com>
Subject: Re: [PATCH v2 35/50] convert selinuxfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 11:24=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> =
wrote:
> On Tue, Oct 28, 2025 at 08:02:39PM -0400, Paul Moore wrote:
>
> > I suppose the kill_litter_super()->kill_anon_super() should probably
> > be pulled out into another patch as it's not really related to the
> > d_make_persistent() change,
>
> It very much is related - anything persistent left at ->kill_sb() time
> will be taken out by generic_shutdown_super().  If all pinned objects
> in there are marked persistent, kill_litter_super() becomes equivalent
> to kill_anon_super() for that fs.

Gotcha, thanks.

--=20
paul-moore.com

