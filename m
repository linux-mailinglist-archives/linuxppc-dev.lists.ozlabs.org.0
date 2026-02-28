Return-Path: <linuxppc-dev+bounces-17439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOkGLt2Gomn03gQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 07:10:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B091C07C3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 07:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNFDS5x07z3bjN;
	Sat, 28 Feb 2026 17:10:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772247477;
	cv=none; b=OD6Gh3/lXlDP4Aq/KyyxPeJDIwYal23ZVGVtOP07inSpnRSESwePhr/gCNv4t4wSUrGjl77Jh/wO3h+NkXTn+K3AemRpLdYraUpbmwTSWdZIhLYrwT6Lh2wpTobLFKWoy9QYf4JgR/rAQtaBpeesZXmGzgdjMou4v37BgwAYiRfsXkO4S/TtMmpF2/rI6mciwWZlFfWm/daYLxYGIHd7vcgZyn7E1ZL/VPIJPCJAH+ZjNNRWap6qi8LHyCuAY9jR7xE6+Lr/dLRT1FM3KNJAbXMBeonwdCtN5+LyvJu1zMnDVDk5nirAQzTnp1Q5fttv4HFX7oyBoL4LiEbQ9CbFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772247477; c=relaxed/relaxed;
	bh=Ul9ErbzYFrTHEYKr0As/6D1/FUSyXsPZPt7ruX+ITJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pez0sdhXJ6P7QdJhRrL/7QqR/6NtL0zV/1Z+75RP/aoSgQUwUrAvRvGh2suybSz9Th6MWAXdJqI6V3EsDSjbQVSPINmsyNw2nXqyaZ7kmA9mWrBS9yMS/wb4TveOu9KNsOJ6F7IoCf6XxLkJ9ApG/AIz93o1r1Z4vCuQKZg8yn8F6TBYGeWFvMRRI1tuTX8Z9csuBL9JBLt2PZFRJ1sv91kY+sPYj2ba7QfwaLHBukFDeycLraUgWtghOkOf9h7F1tIwDmtlQVTscTdxare5P+T6Bp7+8VTPbnD3sz0wg1rEXiRgnMLW/kOEGHWH1LA1NqWNF/qTo5vqE9KHHyvA4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InHpyns8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InHpyns8; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=czhong@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InHpyns8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=InHpyns8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=czhong@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN8yC6wLSz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 13:57:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772247470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ul9ErbzYFrTHEYKr0As/6D1/FUSyXsPZPt7ruX+ITJg=;
	b=InHpyns8aX4mTKl8+octJleoOVLtWKHuFdfuyRSzp6BIfOfc+RCXs9NyQvDUq6p1W6zaFo
	bC3T1xTbxeoJudxjZUcUrvnOIrYuSKLwbSEstFOkOiJUJJV+owo+LaH/y5j+Y5jrVGmvkX
	AkzpRomGb1rKTEpW2nDSO1PDtjKPWD8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772247470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ul9ErbzYFrTHEYKr0As/6D1/FUSyXsPZPt7ruX+ITJg=;
	b=InHpyns8aX4mTKl8+octJleoOVLtWKHuFdfuyRSzp6BIfOfc+RCXs9NyQvDUq6p1W6zaFo
	bC3T1xTbxeoJudxjZUcUrvnOIrYuSKLwbSEstFOkOiJUJJV+owo+LaH/y5j+Y5jrVGmvkX
	AkzpRomGb1rKTEpW2nDSO1PDtjKPWD8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-SgA9s710PrWbLBU1mMwQdQ-1; Fri, 27 Feb 2026 21:57:48 -0500
X-MC-Unique: SgA9s710PrWbLBU1mMwQdQ-1
X-Mimecast-MFC-AGG-ID: SgA9s710PrWbLBU1mMwQdQ_1772247467
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-389fc2e65adso18560611fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 18:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772247467; x=1772852267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ul9ErbzYFrTHEYKr0As/6D1/FUSyXsPZPt7ruX+ITJg=;
        b=NGHpiMw16/+lA4RkFVZeOO9UMRH4jP9tk9mchlPxwOTXJU0KNrtOko9hnM/dgX+pUW
         JXbSmfLym8IaowOrPAkGhbGVORoVxyCcvhRYcxkmH5F+Q8XtyZxhUhm5NedJ8DUAB9i7
         vI/n+VTn5MInwD6IZ54W5DSWtbUR2QinSU33mUzsfizmLY/CunkJjAtuWE8i+46p6yyl
         T/J+MBfkTy9Dx/nnEhpZcAW7e+Z7z70wSwC0rwjOtsbLfGmFKtuQVY+K+Lk8jGV8jnUY
         XRvNlFZFJZTn5SXz6lFw6/5fRdYtS69dxnFd9DLsy3GqB2BR7wIjB1c7ayUPnvq9llU9
         ERvw==
X-Forwarded-Encrypted: i=1; AJvYcCVymYq0HsMzV9iJGFS21/R66wJmr6f3qZOaZZy2KcVEucQ+lUzNRASdf/6F1Z/G2ySVXLsfL3YSuopKqvo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyfmK8XiwdmJU3doe8zp8xMyXK8T+5gu1UyBYS75hiLtA706H2A
	Vn+Y5xupyuSThfInU8b3/XyGF3SVrk6O9KaoU3aDzOshqwefemb8EOZmH5iHgJLkPLgCA6MeXAV
	t5YvUkFb2VSduMVTgkeJeFYwRTfZGQku57j3kZPlK3Zv9iXBxAkFZB+LljsRUk+JLTM3Fw8Z1rP
	NvYKIdnQKXZRiqt29shgQ8eZ+m5U6t2klNt28ws5JxyA==
X-Gm-Gg: ATEYQzxmsEhZh56RfgtNdLuXqFPEGXj40qWpqrMh7kVqhgRtx/TS25B8VUB9eCC33bX
	d1d3hUP2ghz5JO3+jlEhCD10lMBhrCvcRHE4K5WDa4I3g4SwNnVY/z5Vlp+Yewmq3ZaSV0JrVbP
	2dmgNf8AlYatr+wdgSf0Xp8btwe7BjFXvnMj3VdwNuxB0jK0pffJnp5jkc4+YMMv8HY5zAQ2DLS
	xMpOsfdnAXmoCFUklK6DaDfM7+mtMt+VN1GP/G5Er5GI8AEIZw1nG6mBhr91UGQHNSVk3TFcydk
	k/EYJQ==
X-Received: by 2002:a05:651c:893:b0:389:fc69:45e8 with SMTP id 38308e7fff4ca-389ff13552fmr36092191fa.13.1772247466604;
        Fri, 27 Feb 2026 18:57:46 -0800 (PST)
X-Received: by 2002:a05:651c:893:b0:389:fc69:45e8 with SMTP id
 38308e7fff4ca-389ff13552fmr36092081fa.13.1772247466164; Fri, 27 Feb 2026
 18:57:46 -0800 (PST)
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
 <CAFj5m9+OCswLULgVx8eSydTG0OeN4f-8dK1-JyoAA70CNF88Qg@mail.gmail.com>
 <CADUfDZrq96YGiMN9==gMitAHZtXydOAwy-767-d0j5LdUqO91Q@mail.gmail.com> <df5dac1b-286d-43d5-a742-375b6de8730f@kernel.org>
In-Reply-To: <df5dac1b-286d-43d5-a742-375b6de8730f@kernel.org>
From: Changhui Zhong <czhong@redhat.com>
Date: Sat, 28 Feb 2026 10:57:34 +0800
X-Gm-Features: AaiRm50A-oreMROg-IZY0a7VYOIC_N5HQ9n4L5iqJp7NRvUvCh2O8zvAPssSEws
Message-ID: <CAGVVp+X6jSJeKoJ0YAjGqcvrwPMBThLRpD176SG2OR20s08XgA@mail.gmail.com>
Subject: Re: [bug report] Bug: Write fault blocked by KUAP!
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Caleb Sander Mateos <csander@purestorage.com>, Ming Lei <ming.lei@redhat.com>, 
	Linux Block Devices <linux-block@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5_f82oU7oyc1YZEo2q8NAj39hoSsNKF8Lndl1ZQ1374_1772247467
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:csander@purestorage.com,m:ming.lei@redhat.com,m:linux-block@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	FORGED_SENDER(0.00)[czhong@redhat.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17439-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[czhong@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C6B091C07C3
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 3:05=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
>
>
> Le 26/02/2026 =C3=A0 17:59, Caleb Sander Mateos a =C3=A9crit :
> > On Thu, Feb 26, 2026 at 4:44=E2=80=AFAM Ming Lei <ming.lei@redhat.com> =
wrote:
> >>
> >> On Thu, Feb 26, 2026 at 6:48=E2=80=AFPM Ming Lei <ming.lei@redhat.com>=
 wrote:
> >>>
> >>> Hi Changhui,
> >>>
> >>> Thanks for the report!
> >>>
> >>> Loop Caleb Sander Mateos  in.
> >>>
> >>> Thanks,
> >>>
> >>> On Thu, Feb 26, 2026 at 6:37=E2=80=AFPM Changhui Zhong <czhong@redhat=
.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> on the ppc64le arch, I hit the issue below with ublksrv on the lates=
t
> >>>> linux-block/for-next, please help check it, and let me know if you
> >>>> need any info/test for it. Thanks.
> >>>>
> >>>> INFO: HEAD of cloned kernel
> >>>> commit 37a43fd770f3dcac8f72f3ea909b3e893e2385c9
> >>>> Merge: 13cd9b41227a c1dfbd7e71b0
> >>>> Author: Jens Axboe <axboe@kernel.dk>
> >>>> Date:   Wed Feb 25 08:37:06 2026 -0700
> >>>>
> >>>>      Merge branch 'for-7.1/block' into for-next
> >>>>
> >>>>      * for-7.1/block:
> >>>>        ublk: report BLK_SPLIT_INTERVAL_CAPABLE
> >>>>
> >>>> reproducer:
> >>>> compile and install https://eur01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fgithub.com%2Fublk-org%2Fublksrv.git&data=3D05%7C02%7Cch=
ristophe.leroy2%40cs-soprasteria.com%7Cf0b0066758be476be95508de75587a73%7C8=
b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639077220067774377%7CUnknown%7CTW=
FpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI=
joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dki4yUMx%2FBTANcpfzEoVMdBKs=
uflIbzhHO2Wqpxtvj5g%3D&reserved=3D0
> >>>> #echo 0 > /proc/sys/kernel/io_uring_disabled
> >>>> #modprobe ublk_drv
> >>>> #cd ublksrv
> >>>> #make test T=3Dnull
> >>>> #make test T=3Dloop
> >>>>
> >>>> dmesg log=EF=BC=9A
> >>>> Feb 26 00:24:30 ibm-p9z-27-lp26 journal: running null/002
> >>>> Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: start ublksrv io
> >>>> daemon ublksrvd-0
> >>>> Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57923: ublk d=
ev
> >>>> 0 queue 0 started
> >>>> Feb 26 00:24:30 ibm-p9z-27-lp26 ublksrvd-0[57921]: tid 57924: ublk d=
ev
> >>>> 0 queue 1 started
> >>>> Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083476.4882] platform-linux: do-add-ip6-address[2:
> >>>> fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IP=
v6
> >>>> is disabled on this device)
> >>>> Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083476.4885] platform-linux: do-add-ip6-address[2:
> >>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> >>>> ipv6: IPv6 is disabled on this device)
> >>>> Feb 26 00:24:36 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083476.4938] l3cfg[0f1985ec14299e62,ifindex=3D2]: unable to
> >>>> configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
> >>>> rt-src ipv6ll
> >>>> Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083478.4938] ipv6ll[95ab7f3fdbfe643d,ifindex=3D2]: changed: no =
IPv6
> >>>> link local address to retry after Duplicate Address Detection failur=
es
> >>>> (back off)
> >>>> Feb 26 00:24:38 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083478.4943] platform-linux: do-add-ip6-address[2:
> >>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> >>>> ipv6: IPv6 is disabled on this device)
> >>>> Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083488.5034] platform-linux: do-add-ip6-address[2:
> >>>> fe80::8448:a3ff:fe51:f102]: failure 13 (Permission denied - ipv6: IP=
v6
> >>>> is disabled on this device)
> >>>> Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083488.5037] platform-linux: do-add-ip6-address[2:
> >>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> >>>> ipv6: IPv6 is disabled on this device)
> >>>> Feb 26 00:24:48 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083488.5041] l3cfg[0f1985ec14299e62,ifindex=3D2]: unable to
> >>>> configure IPv6 route: type unicast fe80::/64 dev 2 metric 1024 mss 0
> >>>> rt-src ipv6ll
> >>>> Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083490.5034] ipv6ll[95ab7f3fdbfe643d,ifindex=3D2]: changed: no =
IPv6
> >>>> link local address to retry after Duplicate Address Detection failur=
es
> >>>> (back off)
> >>>> Feb 26 00:24:50 ibm-p9z-27-lp26 NetworkManager[818]: <warn>
> >>>> [1772083490.5039] platform-linux: do-add-ip6-address[2:
> >>>> 2620:52:9:160c:8448:a3ff:fe51:f102]: failure 13 (Permission denied -
> >>>> ipv6: IPv6 is disabled on this device)
> >>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Kernel attempted to read use=
r
> >>>> page (7fff81210000) - exploit attempt? (uid: 0)
> >>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: ------------[ cut here ]----=
--------
> >>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: Bug: Read fault blocked by K=
UAP!
> >>>> Feb 26 00:24:58 ibm-p9z-27-lp26 kernel: WARNING:
> >>>> arch/powerpc/mm/fault.c:231 at bad_kernel_fault.isra.0+0xc8/0x2c0,
> >>>> CPU#5: lt-ublk.null/57924
> >>
> >> oops, it shouldn't be related with `ublk: report BLK_SPLIT_INTERVAL_CA=
PABLE`,
> >> Perhaps one issue lies in the ppcle64 architecture code.
> >
> > Agreed, the "Kernel attempted to read user page" error seems
> > incorrect. The call trace shows this is in copy_from_iter(), so
> > reading a user page is expected. I too would be suspicious of the
> > powerpc copy_from_iter() implementation.
>
> Looks similar to:
>
> https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com=
/
>
> That fix was rejected, more acceptable fix here:
>
> https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/
>
> Let us know if it fixes the issue for you.
>
> Christophe
>

Hi=EF=BC=8C Christophe

confirmed that after applying the patch
https://lore.kernel.org/all/20260217124457.89219-1-sayalip@linux.ibm.com/,
this issue has not been hit again, the fix works.

Thanks,
Changhui


