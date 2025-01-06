Return-Path: <linuxppc-dev+bounces-4685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAEEA01F17
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 07:07:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRNxR2mkMz2yyD;
	Mon,  6 Jan 2025 17:07:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736143627;
	cv=none; b=Td6ZPOmQLH0xz0BkxfjAWlMFx/z39U5GC3yYuAmrIM65r/92GzLyGMlfaT2Twg41J1VdK2uGHrUPKh5XfWxn5DtT0NQsDezvXlX5uSkXZ0Tj1kzsk3V1lBnbjQT26wM+UidwNiITdPv+A8po3q9UglB790U6LXqgzjlMO7eRaYTgPpRp67RTFxI4oiMUJjt2fIWgqofvAkaJcntThcYMK0wGFxUwCqTPHS+R3g/1DtYBm44AFF/gbpR7Gu7CbeOSg0BlWpBYOsn66av5UwFzHiJK93J5jD/5rTyNKfTVQyoyeHpSwC/AO4QoQEqd2LRXthDGlNbzMQXrYxT8ci/7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736143627; c=relaxed/relaxed;
	bh=rZEyOknT6FMXaCRBHIS8IeQzepG9pSVU98fwitc15cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITJWDki8vn/eACiDCnh5tYWHcIyJzJog1bTO6t+yD3TAsk2iHNEgVtHfCCbCjoSD2MecZtMECSLWGDv1Pik1f4luoHLIbOlwHUUQWFlKYVt/UFXSpgPa7PRU61Mu18UKNPhjQnF3xSyE1jX9qEATbuj52tyxiLTtk7+0ROLjzSr5L/jhK7DCu8Fggw0oAkL18Gp6F+/5dEp/1S+BJlPDBXUBZJo99MJY9k1xwmBiUmPdxG4J9aAgiS5TVeos5Smso7Qn31iXNgOw2OOrUDPw6VHZbHV2XcXfXxmfSx66coFmFPNjPKDUcYCz9CBEoUcVTJqkwfApLfhJsQSK8z014g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4bHKwFG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4bHKwFG; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4bHKwFG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i4bHKwFG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRNxP4n9kz2xy2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 17:07:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736143619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZEyOknT6FMXaCRBHIS8IeQzepG9pSVU98fwitc15cw=;
	b=i4bHKwFG3mgWfja0ekFgrk7dbUIZ4JUnqiY2Ydk4zj2BcYJvaMN9QVWPWlFVhrIKt65qnv
	sEAw2jKNuWQ/jNZr0D/20CKVmg1XKYgB5sNswiYV+UvRhMHBdF2nCgQzqqHFH6WA6goiVE
	vyg1eZ+2imwNPzslNqAvY9zVBn5Kl98=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736143619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZEyOknT6FMXaCRBHIS8IeQzepG9pSVU98fwitc15cw=;
	b=i4bHKwFG3mgWfja0ekFgrk7dbUIZ4JUnqiY2Ydk4zj2BcYJvaMN9QVWPWlFVhrIKt65qnv
	sEAw2jKNuWQ/jNZr0D/20CKVmg1XKYgB5sNswiYV+UvRhMHBdF2nCgQzqqHFH6WA6goiVE
	vyg1eZ+2imwNPzslNqAvY9zVBn5Kl98=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-680-Ol1aODmFNWyCxf2Aofwj4g-1; Mon,
 06 Jan 2025 01:06:55 -0500
X-MC-Unique: Ol1aODmFNWyCxf2Aofwj4g-1
X-Mimecast-MFC-AGG-ID: Ol1aODmFNWyCxf2Aofwj4g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 301221956087;
	Mon,  6 Jan 2025 06:06:52 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5FC319560A2;
	Mon,  6 Jan 2025 06:06:49 +0000 (UTC)
Date: Mon, 6 Jan 2025 14:06:45 +0800
From: Baoquan He <bhe@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, devel@daynix.com
Subject: Re: [PATCH v2 1/5] elf: Define note name macros
Message-ID: <Z3ty9adBwE+C/guf@MiWiFi-R3L-srv>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
 <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
 <Z3s+QeMv8AaGbMGs@MiWiFi-R3L-srv>
 <70daf544-f59f-404b-bec0-0d60e892a9e9@daynix.com>
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
In-Reply-To: <70daf544-f59f-404b-bec0-0d60e892a9e9@daynix.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/06/25 at 02:07pm, Akihiko Odaki wrote:
> On 2025/01/06 11:21, Baoquan He wrote:
> > On 01/04/25 at 11:38pm, Akihiko Odaki wrote:
> > > elf.h had a comment saying:
> > > > Notes used in ET_CORE. Architectures export some of the arch register
> > > > sets using the corresponding note types via the PTRACE_GETREGSET and
> > > > PTRACE_SETREGSET requests.
> > > > The note name for these types is "LINUX", except NT_PRFPREG that is
> > > > named "CORE".
> > > 
> > > However, NT_PRSTATUS is also named "CORE". It is also unclear what
> > > "these types" refers to.
> > > 
> > > To fix these problems, define a name for each note type. The added
> > > definitions are macros so the kernel and userspace can directly refer to
> > > them.
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > > ---
> > >   include/uapi/linux/elf.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++--
> > >   1 file changed, 83 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> > > index b44069d29cec..014b705b97d7 100644
> > > --- a/include/uapi/linux/elf.h
> > > +++ b/include/uapi/linux/elf.h
> > > @@ -372,8 +372,6 @@ typedef struct elf64_shdr {
> > >    * Notes used in ET_CORE. Architectures export some of the arch register sets
> > >    * using the corresponding note types via the PTRACE_GETREGSET and
> > >    * PTRACE_SETREGSET requests.
> > > - * The note name for these types is "LINUX", except NT_PRFPREG that is named
> > > - * "CORE".
> > >    */
> > >   #define NT_PRSTATUS	1
> > >   #define NT_PRFPREG	2
> > > @@ -460,9 +458,91 @@ typedef struct elf64_shdr {
> > >   #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
> > >   #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
> > > -/* Note types with note name "GNU" */
> > > +/* Note used in ET_EXEC and ET_DYN. */
> > >   #define NT_GNU_PROPERTY_TYPE_0	5
> > > +/* Note names */
> > > +#define NN_PRSTATUS	"CORE"
> > > +#define NN_PRFPREG	"CORE"
> > > +#define NN_PRPSINFO	"CORE"
> > > +#define NN_TASKSTRUCT	"CORE"
> > > +#define NN_AUXV	"CORE"
> > > +#define NN_SIGINFO	"CORE"
> > > +#define NN_FILE	"CORE"
> > > +#define NN_PRXFPREG	"LINUX"
> > 
> > No objection to make them clearer. Thanks for the effort.
> > 
> > Wondering where below arch specific macros are used. So you just
> > added all NN_xxx for the corresponding NT_xxx? Not sure if this is
> > needed if we don't use them at all in the current kernel.
> 
> Indeed I just added all NN_xxx. The kernel won't use the macros that are
> defined as "LINUX"; fs/binfmt_elf.c uses "LINUX" by default as the notes
> named "CORE" or "GNU" are exceptional.
> 
> Userspace applications may still be interested in these macros as
> demonstrated in:
> https://lore.kernel.org/r/Z3f7zJwu8bu8HYln@e133380.arm.com
> 
> These macros also serve as documentation; correcting and clarifying the
> documentation is the main purpose of this series.

I see, thanks. Then the overall series looks good to me.


