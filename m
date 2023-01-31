Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD66827C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 09:57:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5f7J2FtTz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 19:57:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ly0D4nk2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ly0D4nk2;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5f6L3c3Cz2yXL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 19:56:09 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id m2so9387931plg.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 00:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX0UGZfxPS8os5colbRVKgpsLWa69is39Zj4v+JhyhE=;
        b=ly0D4nk2P9aSK/sJZkoo1mEiXcBf0LFW4bUt/kneiPrTebL8wpsmv3JyKC3mn5ZVSP
         YAkI1sOsbu3zOFiVT1ODfpFPx1hmgIrnj7I07uLcxggNAod//gU5VDQu2iteHd2ZtCS2
         zf1HLto4/d2h/Wl8DB9NNJGMC43ucjEfGWTqpMmL/czk4oMCb+9F8YN0gUkXO7i9zA55
         l0gf7ZJmgqyf5zUvkDjYgtXEqOJbsV4dIlMXpAp6mvPndLtPLpMU3BXQyfaRr6OEXmr9
         yqwrXQUX+VPe1TtubHYWSvA5DdmFJWfnuJVKxWZbuTdd9bOi/T1Fw29npIpCR5tq7AGz
         NZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BX0UGZfxPS8os5colbRVKgpsLWa69is39Zj4v+JhyhE=;
        b=2/fHQTSBbwl+yLWC8jJWTnykiw63s6BS460NzvVtP+2AXmpQWJeRt6yQmiUbTULZuS
         8Ipxdc4yECMHKRePd6WWIMdu6iuDpknEDT2RFdvm1qeNaupNWBb+IdGpbp3aKhQnd59b
         YF4ulowe1sJGIeWuYioVuARrrnDXxAsOV1845Tk1CKMLdWYLHmKDikjChdBfsvH5kMaw
         144D9V6UctnnZ+TWrHt1IjX0HQTqNZkQStC/yCWhyk+/S5kSW/O+A9wbwQFIoLAX6G2i
         cTfkQhUUuzwt431t+QtADK5jh5RbQZx/RBNxUp21aF36bDYrcC2ne3Wqb0MGvPdNnBxG
         JMyQ==
X-Gm-Message-State: AO0yUKUrJpWJ3PGhdCfT5J1daOLwKwZw7X8Nre/NdXdi7ZEnCOlWhJUb
	ntKjICmosEBpAZDJPw69jBQol0O6356how==
X-Google-Smtp-Source: AK7set/bgmw4FQVYher8ierqKhzmTrpUi6hwBXZSwOO5OSdUlvgGYSEN6+dlGxNHjZixrCuy4IITLg==
X-Received: by 2002:a05:6a20:7f90:b0:be:9fff:48e2 with SMTP id d16-20020a056a207f9000b000be9fff48e2mr6572327pzj.39.1675155366415;
        Tue, 31 Jan 2023 00:56:06 -0800 (PST)
Received: from localhost ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id q15-20020a056a00150f00b00593e84f2d08sm1303203pfu.52.2023.01.31.00.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 00:56:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Jan 2023 18:55:58 +1000
Message-Id: <CQ690JS6Q5RG.8KHL6V7BODI0@bobo>
Subject: Re: [PATCH v4 22/24] powerpc/pseries: Implement secvars for dynamic
 secure boot
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-23-ajd@linux.ibm.com>
 <CQ05ZDYG6KNU.1G9O3ITQDIHEM@bobo>
 <9f16d86e855f22823ee24e6a6236a16556425f29.camel@linux.ibm.com>
In-Reply-To: <9f16d86e855f22823ee24e6a6236a16556425f29.camel@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jan 31, 2023 at 12:54 PM AEST, Andrew Donnellan wrote:
> On Tue, 2023-01-24 at 15:17 +1000, Nicholas Piggin wrote:
> > > +static const char * const plpks_var_names[] =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"PK",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"KEK",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"db",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"dbx",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"grubdb",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"grubdbx",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"sbat",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"moduledb",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"trustedcadb",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL,
> > > +};
> >=20
> > Var and key are used somewhat interchangeably? These are keys, I
> > think?
> > And plpks could have other vars but we're only interested in (at
> > least a
> > subset of) keys here if I understood right.
> >=20
> > I guess the terminology is like that throughout secvar so maybe
> > nothing
> > to be done.
>
> The "key" terminology seems to come from OPAL, while on the PLPKS side
> it's a bit of a mess but "var" follows the usage in existing code (the
> spec refers more to "objects").
>
> >=20
> > > +
> > > +static int plpks_get_variable(const char *key, u64 key_len, u8
> > > *data,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 *data_size)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct plpks_var var =3D {=
0};
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int rc =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.name =3D kcalloc(key_l=
en - 1, sizeof(wchar_t),
> > > GFP_KERNEL);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!var.name)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D utf8s_to_utf16s(key=
, key_len - 1, UTF16_LITTLE_ENDIAN,
> > > (wchar_t *)var.name,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 key_len - 1);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc < 0)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err;
> >=20
> > Okay I can't work out why it's key_len - 1 rather than key_len.
>
> The existing code in secvar-sysfs.c calls secvar_ops->get() with
> key_len =3D strlen(name) + 1, to include the null byte, which is what
> OPAL expects. For PLPKS, the variable name explicitly does not include
> a trailing null byte.
>
> I'll add a comment indicating as such, perhaps at some later point it
> can be reworked.
>
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.namelen =3D rc * 2;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.os =3D PLPKS_VAR_LINUX=
;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (data) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0var.data =3D data;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0var.datalen =3D *data_size;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D plpks_read_os_var(&=
var);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*data_size =3D var.datalen=
;
> > > +
> > > +err:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(var.name);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (rc && rc !=3D -ENOENT)=
 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0pr_err("Failed to read variable '%s': %d\n", key,
> > > rc);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0// Return -EIO since userspace probably doesn't
> > > care about the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0// specific error
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0rc =3D -EIO;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
> > > +}
> > > +
> > > +static int plpks_set_variable(const char *key, u64 key_len, u8
> > > *data,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 data_size)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct plpks_var var =3D {=
0};
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int rc =3D 0;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 flags;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// Secure variables need t=
o be prefixed with 8 bytes of
> > > flags.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// We only want to perform=
 the write if we have at least
> > > one byte of data.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (data_size <=3D sizeof(=
flags))
> >=20
> > So it's unstructured 8 byte of flags, not a u64 integer? Why not u8
> > flags[8] then?
>
> No, it's a u64 and it's passed in the hcall as a single u64.

In host endian? This is done so userspace can acces it with the existing
secvar API, right? I suppose that's okay...

> > > +static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct plpks_var var =3D {=
0};
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t ret;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.component =3D NULL;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// Only the signed variabl=
es have null bytes in their
> > > names, this one doesn't
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.name =3D "SB_VERSION";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.namelen =3D 10;
> >=20
> > Could you make that strlen(var.name) for the benefit of those of us
> > with
> > missing fingers?
>
> Will do.
>
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.datalen =3D 1;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0var.data =3D kzalloc(1, GF=
P_KERNEL);
> >=20
> > This could just point to a u8 on stack I think?
>
> Until we get VMAP_STACK and we'll have to switch back.

AFAIKS plpks_read_var does not require linear map, so should not be
required. IMO that's the right way to go for an external API, so
actually plpks_write_var is the outlier there and should be changed
to follow read and remove in not requiring special pointers.

Thanks,
Nick
