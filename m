Return-Path: <linuxppc-dev+bounces-4473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9A9FC53A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2024 13:49:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJBQm2F5cz2yLB;
	Wed, 25 Dec 2024 23:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735130944;
	cv=pass; b=X1ByYyz9qAFwN8iy8EJPNxZmhGeyJ2sLiCqdv+aamOLY4t6DqgnEmiMHZX8m3hSd2mdBsIt1oi4sNcVGNNT2ohS3HJ7B4ke+NncxRehEM1/MKxxycNRQVzhdayA7OupiwQJT3uM5TbGYVM1ug1XfDQxGIiyDOvI3uMs12sbePC7TPVLUOwcrdQifYpiwIEtZZrfgrtB5/KpVhphh6w5eUQz1bYwpS4ow9sCUB4/MF0hZV/TrNOJLD6gmVsbS0clnEpJ+V05LyRRrjkC/43wdb+PzSBXK0MJ1dN2B7/UBT8brr8Knpch0Y7NxHxMAMhsh4ZJVVEOkgvPB3WNG7a6gCg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735130944; c=relaxed/relaxed;
	bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EaSd0/L+/wQac3syNm9awpSzq2TlMgAQFwxir1FMohhxHk9uJ59DMAqr2ScPb+H6ELJldt+khCW/RenSrj6OWTyCt4Jx7Gz9MqjVyGLe90yarKrvDR6+BDBZLEMns+CP7in4ptlVvrPT4M34KhT5RAa+yyBPxfGJfPDFQdfVdha1+GYm0r51MsZrajAJJ02vUSP3CYrFwj7U4jIWf+h+I6CTrjqu6D14w/YebHzCt54vFbP4nWGW2RY+jpJcndaWUh811DxOkkC/vvx0Aug8FpMgIUKXpu2gbgDD8MQBbR+3QLLdWkEmEbmw5dR3ygsr6tIRuWGYOv+nO3jr6tkXBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ETwfwcqJ; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=LZUBhxU9; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ETwfwcqJ;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=LZUBhxU9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJBQg2DShz2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2024 23:48:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735130928; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=HlBS37GcAho7pPfEmy/xGBu6ulHDh+jGTVGDoms4Tbit/XFk/fNSrv0ED99g1SOVwm
    /JtkUrLhJtjz/EdlcTpq9aFQ99lN0iOFX80kIErcBdZFLAjJCgQzwI8aLSBYWUgNsFqr
    7ZZ1eGqd6FL8RB3wc7y/wxQFqfJnWwGEqkrGDi/jZUJ25ivSDefP5aakVAQgWmxAVmyp
    jFRzDRQTJTw9XYSSSfUkmPW044UplL39VEBpDC646kGF738Ab245u/RRVWOpVW7uFfjT
    YzZ16E3Rl1gZBkMk4XrteKjes9AbWyXHYcgIweRtlLU/OWjSWxMpxt3Ikc6NoZlyYENV
    K9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735130928;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
    b=L2+TOSHs2MB20P0x5aeHoF8Ai8BGRVtTRWX503SzmDyXleSc0IC0BNq4EbZKxtZteR
    hCls9tW1lyVLVOF4Gr+ADBWyPWZbWLIktmCmtYkT0q3UdCM8joSMBSXio8fpa2AdRu+l
    SOUxcrB4CNH3dF15tOXEZdbVYL8SWPZVjHTtzsTRuaw1n3bljnh8EBizR4wxzlIblHp5
    55BR0jN7jqX8WX+MXDAQo0zwlQCg7ufhd1r9yt7w5DHBnmeNDC+WDXD9L/xgNWIK9Gz0
    52Yxx5j7DmowVHGMV81ORWVelkcKumfgQGXYr4OfbOG8hyH7C/Y/8Mu2Ekd+Nb9eZRI+
    LZGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735130928;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
    b=ETwfwcqJ/+wwDMfoUyqO+7VO4ylb727f7UBnPbdWNKfwY+e8aQ5aNprP2BZNqrx0Xm
    jJz7JUWPdLeYrGZ7AGwPKVy/B+PIzO7Ve1A/2wSAslS9YuW4aCOeWAMfbk0rCv0+8Qvx
    W3mKBPEHK2MIFHmD9lnmHX2MUNlyLOOYaMsDwCAq4EjMqdB5jbUrtG+8txSR6v61fJp0
    OWWJmM/jjpWF5J2MngtSFqwzlGBby08lefdEOZd8Dm+Hy9BbNmB0EInY+rYuLN+ilBMQ
    ddI1UIuNsEbqnTSSnEKyA8YBhRJsulbKbyQAHiyJW98GHqpryWYZnQDAQObZqq04H5XK
    FLTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735130928;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=wJspGqQsSS7NlbzLg4iXsPohCxPlx0AOUnHVDlO0/+w=;
    b=LZUBhxU9TfDpSbdhN8watiVP1ZKxWKlPE1Vig8QNduC+VkbzTnEm48zxy2KriGBXua
    I5XcLCB7qkPniXGqMUDQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BPCmlDId
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 25 Dec 2024 13:48:47 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
 <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
Date: Wed, 25 Dec 2024 13:48:47 +0100
X-Mailer: BrassMonkey/33.4.0
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
In-Reply-To: <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 24/12/24 12:42, Paolo Bonzini wrote:
> On 12/24/24 12:05, Christian Zigotzky wrote:
>> Hello Paolo,
>>
>> Thanks a lot for your patch.
>>
>> I tested it with the RC4 of kernel 6.13 today but unfortunately it 
>> doesn't solve the KVM HV issue. The guest system doesn't boot and I 
>> can't see any error messages. (console=ttyS0)
>
> But do you see anything on the host dmesg (without and with the 
> patch), for example a WARN?
Unfortunately no log during the start of KVM HV.
>
> Also you might try edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 + the 
> patch, to see if there are two bugs.
>
> Paolo
>
I think you mean 419cfb983ca93e75e905794521afefcfa07988bb because "git 
checkout edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4" doesn't work.

Error message: fatal: reference is not a tree: 
edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4

git checkout 419cfb983ca93e75e905794521afefcfa07988bb

Output:

Updating files: 100% (16656/16656), done.
Note: switching to '419cfb983ca93e75e905794521afefcfa07988bb'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.
...
HEAD is now at 419cfb983ca9 KVM: PPC: e500: Use __kvm_faultin_pfn() to 
handle page faults

---

patch -p0 < kvm_main.patch // Your patch

Output:

patching file a/virt/kvm/kvm_main.c

Oh dear, the host kernel doesn't boot. :-(

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


