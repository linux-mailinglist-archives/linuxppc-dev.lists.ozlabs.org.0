Return-Path: <linuxppc-dev+bounces-17269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FFrH0xAoGmrhAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 13:45:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D131A5DAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 13:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMB4R4jHKz2yFd;
	Thu, 26 Feb 2026 23:44:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772109895;
	cv=none; b=DV7FWjw75TWYpqYDxvGfznapEi59NkzipfvPHuaJLC9Vz8l7HGWOI7IohQFpwnHbti67WPZ4rbDJZkrWva/B3ZHQDDqxCQfs1YaMaB4zECLMSOs/jlTVetXWuUww7UTnC8LyK+GHB5BopNhVBHP6X6ok0EoX8tG1laLM1QcyD1wxvYrlaeDudL5CEAHKpP3bj360eLPNSQcRaEXHfTneGBcmbP0lLRRAEqn1/0mYWeXBr7A0Nuhhfr7reH0Za/OyetCBobZTI1aVDIz5/EqChIaTp/M8AIaU2MLCrmtCfNfXzrgpHYVpSZmCkQPaJXinDMYhAs4r7WhsWKGQWNGzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772109895; c=relaxed/relaxed;
	bh=bshf/mcnbaq0IwjhUA3zsi8qImySXUNgNqm9NtsMnU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZomf/P9POmDBP1snVfLvkLn2jioKUx5yfYhSzTSvCUZ/dKRBvofZpRXieZ7Arojj4Y0BmjpYShTiG+paDEbThpGnJRp0/ndQs7rsA5q7kd+HsjjfGJ2naFrgsW1TGRzQnsMShpl/1YHIL0KqEekdlzhR5dgy4HjhfZbtzSMK15IPHCd+GESLUm4ig7iOcDV8p3d2SCyR8rlJLQhl5UVnn7aK9o6MZ/PM9C8GW2X0gLCFELFnQ2gS32RHvQY8AF8fWqb148ZyrNsvrIZU9TRR5MMMDpmEUKNCzk91FgoNQjNQ3xh5Bh19O1gxWp9lIp8AUx0IXfrvWt3/pvzWzBEbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b+YIrubT; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=enDS4FPK; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=minlei@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b+YIrubT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=enDS4FPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=minlei@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMB4Q13Tyz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 23:44:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772109888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bshf/mcnbaq0IwjhUA3zsi8qImySXUNgNqm9NtsMnU8=;
	b=b+YIrubTYdTbq9lul2suVKnmxwglpeAUcAUmxdEzAgnkFRzbjyjOjNhGFKb6WHcB9g1biU
	z5kHSRdKCD2i8MymkMw9uQYzltfB0kg4aSZno2bg94Pu9MyQeP+jQT6vDjbJ1ovuozO/dR
	nyTOzo4A0gO+yX+qQa9qzcDYVdmplgw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772109889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bshf/mcnbaq0IwjhUA3zsi8qImySXUNgNqm9NtsMnU8=;
	b=enDS4FPKxMpnQfWQpTcnsSjRGGdDdr6b0hQv6wyJ9pNjlCe16vAlU2p+qWUQ7ihE6KevZi
	h/U+aF1oXVhwNfZQbmF/mc9NLjhxilkLOM/UYjdLBJWDNJsUq62/bXyrEQdMJ6h3vkm/mC
	iao7fPFEb5BAvt44DnLmJ+5X7EfCpNY=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-O2YxdK6qONK9YY9AZzRxfQ-1; Thu, 26 Feb 2026 07:44:45 -0500
X-MC-Unique: O2YxdK6qONK9YY9AZzRxfQ-1
X-Mimecast-MFC-AGG-ID: O2YxdK6qONK9YY9AZzRxfQ_1772109885
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ff08a88c7aso1030129137.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 04:44:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772109885; x=1772714685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bshf/mcnbaq0IwjhUA3zsi8qImySXUNgNqm9NtsMnU8=;
        b=wI580XviM9UR6VasTFbXlQzyYzYwVF5xUUSxBuwzgTHjUy2iFm7SB1Xy5xcCnCLVMK
         Ivzx/+v/v1BlMSkZ6i/lVgoaaRy1WabvwUv+5zmVcCLeWVA5d6X9MKsGXKlOQ2/4ajT7
         x2SsXaT3qw3eR/9OhUBbU2FevLVhybUVH2u0JAQCxtI+4XkowwWnFyPWiJNgUb37csZ6
         fclKL4sI7kuMEZ04D++zDRiBRJoSx3GPXXK85vdu+19I2qV/9tL6Yrc0cjJcC3jl/z7c
         YOKsFuYA9v9CwMni8jc99JEAVNXclN4yGEJd+DaiZ3r57qD7x8TkDI4A3aL80V44C4RH
         5IFw==
X-Forwarded-Encrypted: i=1; AJvYcCVd23bHx5BPyKiV8l+rXYPVGAB0ZEVLeV0L9cYbYFn9oC4G9twv05azcrKQ6142NwJbn+feJlSRpi+oC2I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxywf1Me/kcC5Au4RrKtVq6MZvMgYwxTEdMGeSp2FazCC7bL5H0
	kTUK14qo620rMHndPCPzj3l8lgNm3xVF3FlMp8SWMGRJjWBYLLWo3Q9GxEsb89/o6SgcKap0szl
	awHXAb8+3woY+nQmLKcFJ9go8lG3gxlul0klLqmLVhOZ9zKG/A/AuhpkIbVN9x9SFP329KBh3fb
	DMHeI+wcHxvNcaO2685Ohw2Z3D/cboGU+hNyq0HUpClg==
X-Gm-Gg: ATEYQzy6OQOOUZ8EfljDdIsmw07cjO7FhhuVZWOm/Unk8YkWXeaQa69J6qZuu6GD0Bq
	0Wrko8bBfE0LJZtjaMi3BuIw+A2/Dhn7uM1oRJbx6VXb3DfnEYqUNgrC4RBUOQMYHODwWTXgyhp
	TrEw9rxbFj+zMyxh+slYn9sh+V+oGlt5EASCJzY6K/eWLrw5/uT1a65RXkQxhXe0eBTE0A9b8oL
	ApEJU8=
X-Received: by 2002:a05:6102:26c4:b0:5fd:fa29:ae15 with SMTP id ada2fe7eead31-5ff20a24165mr745708137.9.1772109884898;
        Thu, 26 Feb 2026 04:44:44 -0800 (PST)
X-Received: by 2002:a05:6102:26c4:b0:5fd:fa29:ae15 with SMTP id
 ada2fe7eead31-5ff20a24165mr745697137.9.1772109884400; Thu, 26 Feb 2026
 04:44:44 -0800 (PST)
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
References: <CAGVVp+U0EYVX+VbbEHzcYP70zdmOXwAmUvpMYV9y3jBSRFmS6g@mail.gmail.com>
 <CAFj5m9L8ahNYFf-tUAZFKAUzkeyqV-Sx94MxC268XJ-hqHPCig@mail.gmail.com>
In-Reply-To: <CAFj5m9L8ahNYFf-tUAZFKAUzkeyqV-Sx94MxC268XJ-hqHPCig@mail.gmail.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Thu, 26 Feb 2026 20:44:32 +0800
X-Gm-Features: AaiRm53VyTpzKmhhQXSLZ_ZoPRe94CeaxghmO6T7uoyLJFYCNdev5YhkPNpazsI
Message-ID: <CAFj5m9+OCswLULgVx8eSydTG0OeN4f-8dK1-JyoAA70CNF88Qg@mail.gmail.com>
Subject: Re: [bug report] Bug: Write fault blocked by KUAP!
To: Changhui Zhong <czhong@redhat.com>, Caleb Sander Mateos <csander@purestorage.com>
Cc: Linux Block Devices <linux-block@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, 
	linuxppc-dev@lists.ozlabs.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w9DDzrAJGKbKNYToSMvdWPXikFaFAo8EYftjiI-iCAc_1772109885
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:czhong@redhat.com,m:csander@purestorage.com,m:linux-block@vger.kernel.org,m:ming.lei@redhat.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[ming.lei@redhat.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17269-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.lei@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A5D131A5DAB
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 6:48=E2=80=AFPM Ming Lei <ming.lei@redhat.com> wrot=
e:
>
> Hi Changhui,
>
> Thanks for the report!
>
> Loop Caleb Sander Mateos  in.
>
> Thanks,
>
> On Thu, Feb 26, 2026 at 6:37=E2=80=AFPM Changhui Zhong <czhong@redhat.com=
> wrote:
> >
> > Hello,
> >
> > on the ppc64le arch, I hit the issue below with ublksrv on the latest
> > linux-block/for-next, please help check it, and let me know if you
> > need any info/test for it. Thanks.
> >
> > INFO: HEAD of cloned kernel
> > commit 37a43fd770f3dcac8f72f3ea909b3e893e2385c9
> > Merge: 13cd9b41227a c1dfbd7e71b0
> > Author: Jens Axboe <axboe@kernel.dk>
> > Date:   Wed Feb 25 08:37:06 2026 -0700
> >
> >     Merge branch 'for-7.1/block' into for-next
> >
> >     * for-7.1/block:
> >       ublk: report BLK_SPLIT_INTERVAL_CAPABLE
> >
> > reproducer:
> > compile and install https://github.com/ublk-org/ublksrv.git
> > #echo 0 > /proc/sys/kernel/io_uring_disabled
> > #modprobe ublk_drv
> > #cd ublksrv
> > #make test T=3Dnull
> > #make test T=3Dloop
> >
> > dmesg log=EF=BC=9A
> > Feb 26 00:24:30 ibm-p9z-27-lp26 journal: running null/002
> > Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: start ublksrv io
> > daemon ublksrvd-0
> > Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57923: ublk dev
> > 0 queue 0 started
> > Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57924: ublk dev
> > 0 queue 1 started
> > Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083476.4882] platform-linux: do-add-ip6-address[2:
> > fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IPv6
> > is disabled on this device)
> > Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083476.4885] platform-linux: do-add-ip6-address[2:
> > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > ipv6: IPv6 is disabled on this device)
> > Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083476.4938] l3cfg[0f1985ec14299e62,ifindex=3D2]: unable to
> > configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
> > rt-src ipv6ll
> > Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083478.4938] ipv6ll[95ab7f3fdbfe643d,ifindex=3D2]: changed: no IPv=
6
> > link local address to retry after Duplicate Address Detection failures
> > (back off)
> > Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083478.4943] platform-linux: do-add-ip6-address[2:
> > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > ipv6: IPv6 is disabled on this device)
> > Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083488.5034] platform-linux: do-add-ip6-address[2:
> > fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IPv6
> > is disabled on this device)
> > Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083488.5037] platform-linux: do-add-ip6-address[2:
> > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > ipv6: IPv6 is disabled on this device)
> > Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083488.5041] l3cfg[0f1985ec14299e62,ifindex=3D2]: unable to
> > configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
> > rt-src ipv6ll
> > Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083490.5034] ipv6ll[95ab7f3fdbfe643d,ifindex=3D2]: changed: no IPv=
6
> > link local address to retry after Duplicate Address Detection failures
> > (back off)
> > Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> > [1772083490.5039] platform-linux: do-add-ip6-address[2:
> > 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> > ipv6: IPv6 is disabled on this device)
> > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Kernel attempted to read user
> > page (7fff81210000) - exploit attempt? (uid: 0)
> > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: ------------[ cut here ]-------=
-----
> > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Bug: Read fault blocked by KUAP=
!
> > Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: WARNING:
> > arch/powerpc/mm/fault.c:231 at bad_kernel_fault.isra.0+0xc8/0x2c0,
> > CPU#5: lt-ublk.null/57924

oops, it shouldn't be related with `ublk: report BLK_SPLIT_INTERVAL_CAPABLE=
`,
Perhaps one issue lies in the ppcle64 architecture code.

I will find one ppc box and try to reproduce this.

Thanks,


