Return-Path: <linuxppc-dev+bounces-17510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEvjCZlmpWmx+wUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 11:29:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1B21D6834
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 11:29:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPZtY4V7Kz3bW7;
	Mon, 02 Mar 2026 21:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::72c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772447381;
	cv=pass; b=O5N0aoYZLBvbddzfmBorduXI/XrQDgmIt+M9e18XSNMFbqw8MfDwgZz/2dXzCm+jZk9Pxlh6sjhOUfmicvWLphgzA/pqA56fZbEfnM/eR5ZCk5QVsB4Qa193udm114N9NiVFx5ANDaRNsIwemL71/i27L4a7UQFJudzveWivk0m5pjBvxsNLzT5WrBVCVz75gQZoAotbrn0jjm3TON3muGG/jyBM3FBl2qYnBPeGqxSKRFECjIWBJHkF4NEPPKmNKpEvv+uiZgJTaesK78OwMBBR2SlTgs17LfNnOdJYEm8ywxG43EKQjEuL+bP5z2TfMqTUkcLUaEyg7/kcyvzHFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772447381; c=relaxed/relaxed;
	bh=h/njpkbtZVt3Kl+KjZ5piSQhFiqZBY8slUODGXpsT5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERkz+Pkdz7+diRKFDagO6IR2cuegsHR1FoYlP8vOSrgqe7LoGW5txpGBSsXIoKALO5M7JFkhf/h4bP6FrOZw5mpSSm+MRBt/RmzDIURZHJcFB0TxKdTXvgULG3pHMSqn5VL7BHFJKQBy22mTGS60o7l1fqwpoCBdtAxsYS7Jul2vDYc7rqEOZBxz9cOLsHCd89m+yeDmy6hliP57MuT0/hqpKZY8H5N8x5tR1kNduQQTGKg+6OqtP3wrrBtZXzVoJWtRsH1KNxFpD0T3kNdPY9KehS6p1isTG81EVHw4FrDyTMxpy/sm0GY4qcl+equ23DTBvW2zDZ6e9nHcpDpxrw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=epXOdIR4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=glider@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=epXOdIR4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=glider@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPZtX3yJMz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 21:29:40 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8cb4097794dso419150785a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 02:29:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772447377; cv=none;
        d=google.com; s=arc-20240605;
        b=BIvgUH7COWB/lOSKkwP03+gP5Aj0nB2dlWK65RqaXGAx420v5dj6BGp9PcJ69K9/Pw
         cVZJ4DYxQ8o+oqoDWuSTWL+kWA2RxrIP0gxUm8SKqMqj748HG3zUI6T+QTcPt4jYxus7
         BByztSGQu6wU/H9e2oAdiE+lnrCK22ay4wRPdDqq149AfQM7veAEozuuT3D/aOkhWquB
         Igi+zbm4Ul6jR03p/DL4jkHGjNjiRdX05OBYwO+jjHxjiqitfxcwHdGnIqWxmlHvObJE
         uKMHqWP38I/4SWhuhlJUXO5n0oBQWS+36aDn1hUIfdFKUTTVSYjiR1sorn8ZvGU7Pdre
         lWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h/njpkbtZVt3Kl+KjZ5piSQhFiqZBY8slUODGXpsT5Y=;
        fh=5I3/vIaUDarYkhpbzBARcXtVjioMttoGTOwQ45f1GdM=;
        b=B5WRnyKbiBjy4+/mqSAQU9XRCnxtfi26BlVqhcR2poH4712vxwE6rn9WXkx13caIm0
         KR50ZAt4uMVbPLbKfb5xlomSAg8mxIZYJ1dkV30Iq8Ivr7ruk9Fj3YHwcLI8YbOVN+VR
         yekeCJlJaD7id2hJ5WBeBELensFh8gelSKVjFVdsOJ1lorvC7vrWAZDTUfgGFJgC3V9v
         qITWDJWg1KV6Fhl4Aqv7KoAAPpLMaAAGimZ4Iryx4dTKUsr4WqKkHI/jlzbzpgrdUyHt
         Rp3RqMSx8Q0OG4xtWNR2Fc0cb2eJdTG196Yeobsn7XvyYx8ZPcjHpnbxGAtZnX7SIuX+
         2BLA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772447377; x=1773052177; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/njpkbtZVt3Kl+KjZ5piSQhFiqZBY8slUODGXpsT5Y=;
        b=epXOdIR4zGmFzNrH4vMGwzYlwUIFjQ/Zho73x9u3WIf6vue3karEze7VV12g8ot71F
         Nt4kpDOr0YoaRVQFwjk6WclfKcJzLLbm45nkvHSdvvpjO0Z5tPQIkDk17mdQ34BhTHUL
         Fgk3JT4RZeQJB5kkT7BpTqD5kFntOGxbW9gaMekCqmWNTms9WIsRTIzeYOQ9Nq/CX5Ly
         GOf6sdRmwBardr/S7KacqEuv1HNqjLyjMmU6VIDHeR4RiLNdQK9pv4O4lCm6IZKVSoL5
         oVtbPjxiFqAH1eiLFFy3D4di2p9mSJHYDU2z6bYqsZWUTDSGav5X0eub0Ec7PDen24Bb
         wOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447377; x=1773052177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h/njpkbtZVt3Kl+KjZ5piSQhFiqZBY8slUODGXpsT5Y=;
        b=Pf11wNigG7jvyks7jbengggvoU6CY9lVd0G7doOzHEvt71GE3PAUP4mei3Au6vSpCY
         +uFQ359aJGJlCpSk5wVRcoWGZODgNLKzIpH2YJeJtIRwpNt8Ll5JoiD/71pv34pn5NvT
         mTpSMvOtjy184d8Ml4MLfUxp05NPSfyFbB+24G7l5vgpZyg9aILBwyjhyZZ/IvPSf8Nl
         31iIjeiZmZtMaBuny3yEbUDWqb3q63ZzluJFD6YS6z56Xc9Le50ztsoWg7di/jW6u0ra
         P1EBX5OgYNOxbrscMH7Ew0nPVoJhKT+irCZQGqFeFFB1lTRDJ9Z1BYm/7IfA6DMYhPxl
         xq8A==
X-Forwarded-Encrypted: i=1; AJvYcCWwMHOw5B8nU2Yh8bo7prVtqsIyTCCHxu1rH6f785diooL3sLXA6WFhKiBkg7ao8BG018LoO2k0Rh33yg0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbOt8sCx9wz/nUJIUt5NIWXm+4l87LjhvSuD5TMURa5SKAne6k
	hftp29/ZQ6LgihwmulPwVsizHUkk2NulMXuWlcdBY+5tH8B1ul1yYLMZrb+uoqjn2/xROZHHWbP
	7MBtWbUbMuakKT1c8/IbK+p0TJSrtj2oNt7HIMhsU
X-Gm-Gg: ATEYQzyJbifZBag2iISeTDTtudcWlNJF9GK8yD01QhCWizQJyLf+VmomHOeB2Ox61G3
	+UqT03rFRiDfVWq7cdW61vzNlCP86vBki308WbUHZHco1sFkjY7y9nXc7+SJDi0Wi7WylEZ3N2t
	iY5sKTusO2sNWz4y/2R+h10V09WOQ1bUnXJ8rz9qHS8FthF2yHmYZPc5G6nHRE0vkGwJTOLSvvG
	HVhx+4K30byuVLs+LPVnIO5PI1MKrMdF/rsvfeNbue2gh445i/iTzgCp2FxG0bNNV1jlxae/FmE
	9sVTZQd0VYgnznyEjAUCl3qqBSYFEeKFDGJHig==
X-Received: by 2002:a05:620a:450e:b0:8c6:b14e:6569 with SMTP id
 af79cd13be357-8cbc8e3099bmr1545558085a.79.1772447377161; Mon, 02 Mar 2026
 02:29:37 -0800 (PST)
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
References: <2f9135c7866c6e0d06e960993b8a5674a9ebc7ec.1771938394.git.ritesh.list@gmail.com>
In-Reply-To: <2f9135c7866c6e0d06e960993b8a5674a9ebc7ec.1771938394.git.ritesh.list@gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 2 Mar 2026 11:29:00 +0100
X-Gm-Features: AaiRm53DRbj7sPLIop0CBXc5s2h5N9WBGDepItjpg99dPeJvb65reF4OaqPzMX8
Message-ID: <CAG_fn=U5weotUtW+TKmX_WRvRSaH+UiqdeDx-4foxVKK_kLNYw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/kasan: Fix double free for kasan pXds
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17510-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:ryabinin.a.a@gmail.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:stable@vger.kernel.org,m:venkat88@linux.ibm.com,m:riteshlist@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[glider@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[googlegroups.com,kvack.org,gmail.com,google.com,arm.com,lists.ozlabs.org,vger.kernel.org,linux.ibm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glider@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3B1B21D6834
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 2:23=E2=80=AFPM Ritesh Harjani (IBM)
<ritesh.list@gmail.com> wrote:
>
> kasan_free_pxd() assumes the page table is always struct page aligned.
> But that's not always the case for all architectures. E.g. In case of
> powerpc with 64K pagesize, PUD table (of size 4096) comes from slab
> cache named pgtable-2^9. Hence instead of page_to_virt(pxd_page()) let's
> just directly pass the start of the pxd table which is passed as the 1st
> argument.
>
> This fixes the below double free kasan issue seen with PMEM:
>
> radix-mmu: Mapped 0x0000047d10000000-0x0000047f90000000 with 2.00 MiB pag=
es
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: double-free in kasan_remove_zero_shadow+0x9c4/0xa20
> Free of addr c0000003c38e0000 by task ndctl/2164
>
> CPU: 34 UID: 0 PID: 2164 Comm: ndctl Not tainted 6.19.0-rc1-00048-gea1013=
c15392 #157 VOLUNTARY
> Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:I=
BM,FW1060.00 (NH1060_012) hv:phyp pSeries
> Call Trace:
>  dump_stack_lvl+0x88/0xc4 (unreliable)
>  print_report+0x214/0x63c
>  kasan_report_invalid_free+0xe4/0x110
>  check_slab_allocation+0x100/0x150
>  kmem_cache_free+0x128/0x6e0
>  kasan_remove_zero_shadow+0x9c4/0xa20
>  memunmap_pages+0x2b8/0x5c0
>  devm_action_release+0x54/0x70
>  release_nodes+0xc8/0x1a0
>  devres_release_all+0xe0/0x140
>  device_unbind_cleanup+0x30/0x120
>  device_release_driver_internal+0x3e4/0x450
>  unbind_store+0xfc/0x110
>  drv_attr_store+0x78/0xb0
>  sysfs_kf_write+0x114/0x140
>  kernfs_fop_write_iter+0x264/0x3f0
>  vfs_write+0x3bc/0x7d0
>  ksys_write+0xa4/0x190
>  system_call_exception+0x190/0x480
>  system_call_vectored_common+0x15c/0x2ec
> ---- interrupt: 3000 at 0x7fff93b3d3f4
> NIP:  00007fff93b3d3f4 LR: 00007fff93b3d3f4 CTR: 0000000000000000
> REGS: c0000003f1b07e80 TRAP: 3000   Not tainted  (6.19.0-rc1-00048-gea101=
3c15392)
> MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48888208=
  XER: 00000000
> <...>
> NIP [00007fff93b3d3f4] 0x7fff93b3d3f4
> LR [00007fff93b3d3f4] 0x7fff93b3d3f4
> ---- interrupt: 3000
>
>  The buggy address belongs to the object at c0000003c38e0000
>   which belongs to the cache pgtable-2^9 of size 4096
>  The buggy address is located 0 bytes inside of
>   4096-byte region [c0000003c38e0000, c0000003c38e1000)
>
>  The buggy address belongs to the physical page:
>  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3c3=
8c
>  head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>  memcg:c0000003bfd63e01
>  flags: 0x63ffff800000040(head|node=3D6|zone=3D0|lastcpupid=3D0x7ffff)
>  page_type: f5(slab)
>  raw: 063ffff800000040 c000000140058980 5deadbeef0000122 0000000000000000
>  raw: 0000000000000000 0000000080200020 00000000f5000000 c0000003bfd63e01
>  head: 063ffff800000040 c000000140058980 5deadbeef0000122 000000000000000=
0
>  head: 0000000000000000 0000000080200020 00000000f5000000 c0000003bfd63e0=
1
>  head: 063ffff800000002 c00c000000f0e301 00000000ffffffff 00000000fffffff=
f
>  head: ffffffffffffffff 0000000000000000 00000000ffffffff 000000000000000=
4
>  page dumped because: kasan: bad access detected
>
> [  138.953636] [   T2164] Memory state around the buggy address:
> [  138.953643] [   T2164]  c0000003c38dff00: fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc fc
> [  138.953652] [   T2164]  c0000003c38dff80: fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc fc
> [  138.953661] [   T2164] >c0000003c38e0000: fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc fc
> [  138.953669] [   T2164]                    ^
> [  138.953675] [   T2164]  c0000003c38e0080: fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc fc
> [  138.953684] [   T2164]  c0000003c38e0100: fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc fc
> [  138.953692] [   T2164] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [  138.953701] [   T2164] Disabling lock debugging due to kernel taint
>
> Fixes: 0207df4fa1a8 ("kernel/memremap, kasan: make ZONE_DEVICE with work =
with KASAN")
> Cc: stable@vger.kernel.org
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

