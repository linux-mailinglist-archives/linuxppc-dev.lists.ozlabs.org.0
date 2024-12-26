Return-Path: <linuxppc-dev+bounces-4477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C19FC951
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 08:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJfgX6Vnqz306S;
	Thu, 26 Dec 2024 18:01:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735196504;
	cv=none; b=nRRr6ygIBcoJ7mfDkY2vglD0wfZNaC4Hd3QH/HLocbIbs24tWrZG8A1c/ebCHjJiDy0JhkzmWjL44HO1L9rrpk9R0mstufnwE4Gn8b2qCG5d16wgimxJP3Ls6VKO0bke26oW/PaYlJL7AXPc7WZsGjlNKE9ZhUXfUWxQ//HCtbEq804NLXWOLyuvfpmADNippeAm+1em3AJX+ilAKLdGhxMZAovy4MLPPjGhxyNLsVvpV2ljKSkQrETEnxsBZgR96DUS24LbzjgE5Ziba8b/Pi2+TUq0k4i0TWaFqgR0ZtclzaMKRfiazKdQZFMrbHvZSSMLTFMLDXEEZBb46eDOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735196504; c=relaxed/relaxed;
	bh=8fQxsL3TfVLtN2PN20FFK4dyk8D821iU5g3JKyZHuK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pz4k5nayn/a1n5ud9NW2frHIZ5X6SFiAQvBUkuJfWHwlZLPUsseTi5DLg8+n5chH5dZxQfguVasuTJjiXC4ByOcReQOEgOhcfd2i/eid0fJo2ItDhAQ1hY22iryg0cKTH+ry3ALGh+rDmYef0ffZJ+Wilc9/5eWxF89CmEQ9+Gkqrr7XKXHlb4uZgEKrAz3KnyU7vBo/RRhKyJlNZoLUJlv4NO6iSuMFy8/u8WJHpBLD0UdpdrmGEEGT9S/EoZ7NDmKjPZdcgwPmAFF82By4juu1Us4KfPs0xDPFZZi/GV7jxcAPjGbXFDh9YSkcOU8WOK/edvvjEhZmnEUjGGemsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1PqZ2FC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1PqZ2FC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1PqZ2FC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W1PqZ2FC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJfgW3frBz306J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 18:01:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735196496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8fQxsL3TfVLtN2PN20FFK4dyk8D821iU5g3JKyZHuK4=;
	b=W1PqZ2FCqP+vuwZ4kcn3Oyk7fp1heWi8f9/RjBONBjnIY6ZntoKi6o+hTonHxUFlTmm4hQ
	/sN555pqmolJblkg9tKQhWVEwJGTMx+qJQ8CseWEa/C3ZZqsvEc2WOYW+S9fpSz/FHbTBA
	8vdvAvpNnq86Oc6u3qs7jr13aZtSsI8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735196496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8fQxsL3TfVLtN2PN20FFK4dyk8D821iU5g3JKyZHuK4=;
	b=W1PqZ2FCqP+vuwZ4kcn3Oyk7fp1heWi8f9/RjBONBjnIY6ZntoKi6o+hTonHxUFlTmm4hQ
	/sN555pqmolJblkg9tKQhWVEwJGTMx+qJQ8CseWEa/C3ZZqsvEc2WOYW+S9fpSz/FHbTBA
	8vdvAvpNnq86Oc6u3qs7jr13aZtSsI8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-7tKdrABkP_2gVHssmmaXtQ-1; Thu, 26 Dec 2024 02:01:33 -0500
X-MC-Unique: 7tKdrABkP_2gVHssmmaXtQ-1
X-Mimecast-MFC-AGG-ID: 7tKdrABkP_2gVHssmmaXtQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385dcadffebso3082882f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2024 23:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735196493; x=1735801293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fQxsL3TfVLtN2PN20FFK4dyk8D821iU5g3JKyZHuK4=;
        b=fvb22OLFVZFlcIhgXDOzMywCGStXXN1KCebU53GYK26+SwZqp/DUvS48vGKYKvafEw
         1jof85UfKcFU+i98d241oMi6ttlhLdoVjmlKJ8KAx0wvWj0ras2SQJSmfmE1jnxnBO6f
         b+/+kRpD9YfroLhj+1Q44aVRp0edaTYuki6pgXvyDd0yN82Z4GFIMSLDDKJJzYurUyAt
         cbYUupAGoo6pjnt+jOAFXrsYfl1OOX59ltIbwUjRoufGj9uiRtMMuhLqNjSXLDUIScqP
         KttFracq+EgjW53ejeOPfIqNIouSku/5qUrCFwTesGjsSTTQaGI1Eq0SMT/iBpbOqX4N
         5ooA==
X-Gm-Message-State: AOJu0YxRUQb2QQTknztbpvA/p4XgpbkhXQHODUMVc2cFspYDYMmp+2Qy
	oruWppkSptK3pIAW9iEJULTtEzq0S0yvjqW8VzD0jqCI99NSoP+eAQB6XxSsYr8L5utoh6Y+qvO
	A9E+BOw012TnPVjxzVxLlxK/A/EW0nB1qmBgP+nVp0YhGSi+XIh+9vhLuj4ES6ysW4I2bDrGCIw
	75LNLi/QengCFYBnBj7FEh15/YYVLF39quW1Wa/Q==
X-Gm-Gg: ASbGncsuJQKFVjLi7Gb+obW72tY9t8lCXT8xM3QCCMJEkPMglneoTeqk+Vcbj1FoDWf
	ZrST4gpX/1cJIAcQ62p1ZsMK+8fPyXDGzvct/Ew==
X-Received: by 2002:a05:6000:4007:b0:382:4926:98fa with SMTP id ffacd0b85a97d-38a223f5c46mr20850010f8f.40.1735196492810;
        Wed, 25 Dec 2024 23:01:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpKIaDGhmjXTuxSXUzGEzYXst6budEvOeS8g3EYCK3ao1R9BtmblVN3cngEBFLwotprpo4bydGpI+0DtVF544=
X-Received: by 2002:a05:6000:4007:b0:382:4926:98fa with SMTP id
 ffacd0b85a97d-38a223f5c46mr20849988f8f.40.1735196492452; Wed, 25 Dec 2024
 23:01:32 -0800 (PST)
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
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de> <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de> <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de> <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com> <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de> <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de> <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
 <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
In-Reply-To: <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 26 Dec 2024 08:00:00 +0100
Message-ID: <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Darren Stevens <darren@stevens-zone.net>, 
	Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>, 
	madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au, 
	regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gYFnx0thSXgu6_5Kys8oBG108I71SmJZ7n69yVwCkxU_1735196493
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008c6d9c062a26ea1c"
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000008c6d9c062a26ea1c
Content-Type: text/plain; charset="UTF-8"

Il mer 25 dic 2024, 13:48 Christian Zigotzky <chzigotzky@xenosoft.de> ha
scritto:

> > But do you see anything on the host dmesg (without and with the
> > patch), for example a WARN?
> Unfortunately no log during the start of KVM HV.
>

Ok.

> Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the
> > patch, to see if there are two bugs.
> >
> > Paolo
> >
> I think you mean 419cfb983ca93e75e905794521afefcfa07988bb because "git
> checkout edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4" doesn't work.
>
> Error message: fatal: reference is not a tree:
> edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4
>
> git checkout 419cfb983ca93e75e905794521afefcfa07988bb
>

That's the upstream commit that doesn't boot.
edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 was the rebased version of the
same commit, where your bisection finished.

Paolo

Output:
>
> Updating files: 100% (16656/16656), done.
> Note: switching to '419cfb983ca93e75e905794521afefcfa07988bb'.
>
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by switching back to a branch.
> ...
> HEAD is now at 419cfb983ca9 KVM: PPC: e500: Use __kvm_faultin_pfn() to
> handle page faults
>
> ---
>
> patch -p0 < kvm_main.patch // Your patch
>
> Output:
>
> patching file a/virt/kvm/kvm_main.c
>
> Oh dear, the host kernel doesn't boot. :-(
>
> --
> Sent with BrassMonkey 33.4.0 (
> https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)
>
>

--0000000000008c6d9c062a26ea1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 25 dic 2024, 13:48 Christian Zigotzky &lt;<a hr=
ef=3D"mailto:chzigotzky@xenosoft.de" target=3D"_blank" rel=3D"noreferrer">c=
hzigotzky@xenosoft.de</a>&gt; ha scritto:</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; But do you see anything on the host dmesg (without and with the <br>
&gt; patch), for example a WARN?<br>
Unfortunately no log during the start of KVM HV.<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Ok.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the <br>
&gt; patch, to see if there are two bugs.<br>
&gt;<br>
&gt; Paolo<br>
&gt;<br>
I think you mean 419cfb983ca93e75e905794521afefcfa07988bb because &quot;git=
 <br>
checkout edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4&quot; doesn&#39;t work.<b=
r>
<br>
Error message: fatal: reference is not a tree: <br>
edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4<br>
<br>
git checkout 419cfb983ca93e75e905794521afefcfa07988bb<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">That&#39;s the upstrea=
m commit that doesn&#39;t boot. edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 wa=
s the rebased version of the same commit, where your bisection finished.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Output:<br>
<br>
Updating files: 100% (16656/16656), done.<br>
Note: switching to &#39;419cfb983ca93e75e905794521afefcfa07988bb&#39;.<br>
<br>
You are in &#39;detached HEAD&#39; state. You can look around, make experim=
ental<br>
changes and commit them, and you can discard any commits you make in this<b=
r>
state without impacting any branches by switching back to a branch.<br>
...<br>
HEAD is now at 419cfb983ca9 KVM: PPC: e500: Use __kvm_faultin_pfn() to <br>
handle page faults<br>
<br>
---<br>
<br>
patch -p0 &lt; kvm_main.patch // Your patch<br>
<br>
Output:<br>
<br>
patching file a/virt/kvm/kvm_main.c<br>
<br>
Oh dear, the host kernel doesn&#39;t boot. :-(<br>
<br>
-- <br>
Sent with BrassMonkey 33.4.0 (<a href=3D"https://github.com/wicknix/brass-m=
onkey/releases/tag/33.4.0" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://github.com/wicknix/brass-monkey/releases/tag/33.4.0</a>=
)<br>
<br>
</blockquote></div></div></div>

--0000000000008c6d9c062a26ea1c--


