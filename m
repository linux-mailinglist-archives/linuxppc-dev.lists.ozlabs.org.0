Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 213747079FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 07:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMK6z0Qghz3fDR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 15:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jq/UBO9I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jq/UBO9I;
	dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMK643n42z3cLC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 15:58:35 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3f38a9918d1so99461cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 22:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684389512; x=1686981512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nrHaiYnMmuYUnRqIyQihIKQ2yAt2h0yhWNAMhh491Wc=;
        b=jq/UBO9ItqD8lGMEVbZAPjZuUQPIHtjBrx8zXMt0zLk2v06XfbOtyD/qbjUIq4K4LV
         vggaXknz/rq2MbnGQlTxzmNfma8ARcAvjHIy4GdasAGqFfimmIrD956Wg4iNBnACDhwf
         H+hMUXn9/fjhzXiu7uCn1r2HOMeI005OxtsQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684389512; x=1686981512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrHaiYnMmuYUnRqIyQihIKQ2yAt2h0yhWNAMhh491Wc=;
        b=DbJXncDERvHVl7O/innDAr8AwDYc922slD7VJA76o81/ukRibbnnkLFqFINeNVuvrd
         GNetfGHTVR8XpF9pmEZFa7Md0j/x2f5aSWaTwMzoYdBahk4ABEQDNT+PqRmCMpt7NzIU
         GWnKJxolxfixzCbx1MN6N6kiNih10RZ03WvzN/ET1dEiauRR0Qchn12UsfwAWsELgRT0
         8BXoUKo7gDRCp4R7donO40ZkhEEn+PQPhLgZT4iTDo3fprSD0sedN7/HeSIXS2jNQNww
         QMnKvYufEDSsplsCDv3+gmAexZH3b83BTYAEd2iIYdlsGqfK61KkTpfg5O68yuGfggKM
         /B5Q==
X-Gm-Message-State: AC+VfDwYLwOWLxaHwBHy6R/Tl8YpF2ketxNppaoVIaxh0VmclPZLnENK
	p4XoSywrXZbice/pUKFyjTnr1vG4jy9OvxEKaym2Yg==
X-Google-Smtp-Source: ACHHUZ6wR53W6umSzUTtVYkZQyqLD3uOkIPbv+RDVOLH5bC8fYo31qcXBoSZ6sM6QQIRD4jvsRzYeLHYCJTufPwFXK8=
X-Received: by 2002:a05:622a:1a95:b0:3ef:3361:75d5 with SMTP id
 s21-20020a05622a1a9500b003ef336175d5mr51964qtc.11.1684389511691; Wed, 17 May
 2023 22:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGsE6KS484iSLkKV8hx2nNThZGfaaz+u+R-A3X5nRev6Gg@mail.gmail.com>
 <ZGT6sTOtk+WY3aYt@bhelgaas>
In-Reply-To: <ZGT6sTOtk+WY3aYt@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Wed, 17 May 2023 22:58:20 -0700
Message-ID: <CANEJEGus1+M2ORKB-XaXnL_iyFRRR_bXmShsAg79Hb31+aAWMA@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000082d49705fbf17e1b"
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000082d49705fbf17e1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 9:03=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Apr 07, 2023 at 04:46:03PM -0700, Grant Grundler wrote:
> > On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > > On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> > > > On Thu, Apr 6, 2023 at 12:50=E2=80=AFPM Bjorn Helgaas <helgaas@kern=
el.org>
> > > wrote:
> > > > > On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:
> > > > > > From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> > > > > >
> > > > > > There are many instances where correctable errors tend to inund=
ate
> > > > > > the message buffer. We observe such instances during thunderbol=
t PCIe
> > > > > > tunneling.
> > > > ...
> > >
> > > > > >               if (info->severity =3D=3D AER_CORRECTABLE)
> > > > > > -                     pci_info(dev, "   [%2d] %-22s%s\n", i, er=
rmsg,
> > > > > > -                             info->first_error =3D=3D i ? " (F=
irst)" :
> > > "");
> > > > > > +                     pci_info_ratelimited(dev, "   [%2d]
> > > %-22s%s\n", i, errmsg,
> > > > > > +                                          info->first_error =
=3D=3D i ?
> > > " (First)" : "");
> > > > >
> > > > > I don't think this is going to reliably work the way we want.  We=
 have
> > > > > a bunch of pci_info_ratelimited() calls, and each caller has its =
own
> > > > > ratelimit_state data.  Unless we call pci_info_ratelimited() exac=
tly
> > > > > the same number of times for each error, the ratelimit counters w=
ill
> > > > > get out of sync and we'll end up printing fragments from error A =
mixed
> > > > > with fragments from error B.

Despite consolidating the error output, my impression is this is still
possible. :(

...
> > > Rate-limiting is per call location, so yes, if we only have one call
> > > location, that would solve it.  It would also have the nice property
> > > that all the output would be atomic so it wouldn't get mixed with
> > > other stuff, and it might encourage us to be a little less wordy in
> > > the output.

Unfortunately, I think this needs further surgery.

> > +1 to all of those reasons. Especially reducing the number of lines out=
put.
> >
> > I'm going to be out for the next week. If someone else (Rajat Kendalwal
> > maybe?) wants to rework this to use one call location it should be fair=
ly
> > straight forward. If not, I'll tackle this when I'm back (in 2 weeks
> > essentially).
>
> Ping?  Really hoping to merge this for v6.5.

I've appended what I have now... but there are still two issues:
1) we still end up with two "pci_info_ratelimited" call locations: one
in aer_print_err() and another in __aer_print_err().
2) I just noticed both functions output info->status and info->mask
(so this ends up getting printed twice in different formats).

and that's not really even looking carefully at the other call site:
cper_print_aer()

If this is "good enough" for now, I can repost as v3.

cheers,
grant

--00000000000082d49705fbf17e1b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PCI-AER-correctable-error-message-as-KERN_INFO.patch"
Content-Disposition: attachment; 
	filename="0001-PCI-AER-correctable-error-message-as-KERN_INFO.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lhspwrpd0>
X-Attachment-Id: f_lhspwrpd0

RnJvbSA1ZWU4Yzg2Y2UwNDk2YmU2Njc4NGVmZjk0ZTBiMTY1YmUzM2Y4M2Y0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHcmFudCBHcnVuZGxlciA8Z3J1bmRsZXJAY2hyb21pdW0ub3Jn
PgpEYXRlOiBUdWUsIDI4IEZlYiAyMDIzIDIyOjA0OjUzIC0wODAwClN1YmplY3Q6IFtQQVRDSCAx
LzJdIFBDSS9BRVI6IGNvcnJlY3RhYmxlIGVycm9yIG1lc3NhZ2UgYXMgS0VSTl9JTkZPCgpTaW5j
ZSBjb3JyZWN0YWJsZSBlcnJvcnMgaGF2ZSBiZWVuIGNvcnJlY3RlZCAoYW5kIGNvdW50ZWQpLCB0
aGUgZG1lc2cgb3V0cHV0CnNob3VsZCBub3QgYmUgcmVwb3J0ZWQgYXMgYSB3YXJuaW5nLCBidXQg
cmF0aGVyIGFzICJpbmZvcm1hdGlvbmFsIi4KCk90aGVyd2lzZSwgdXNpbmcgYSBjZXJ0YWluIHdl
bGwga25vd24gdmVuZG9yJ3MgUENJZSBwYXJ0cyBpbiBhIFVTQjQgZG9ja2luZwpzdGF0aW9uLCB0
aGUgZG1lc2cgYnVmZmVyIGNhbiBiZSBzcGFtbWVkIHdpdGggY29ycmVjdGFibGUgZXJyb3JzLCA3
MTcgYnl0ZXMKcGVyIGluc3RhbmNlLCBwb3RlbnRpYWxseSBtYW55IE1CIHBlciBkYXkuCgpHaXZl
biB0aGUgIldBUk4iIHByaW9yaXR5LCB0aGVzZSBtZXNzYWdlcyBoYXZlIGFscmVhZHkgY29uZnVz
ZWQgdGhlIHR5cGljYWwKdXNlciB0aGF0IHN0dW1ibGVzIGFjcm9zcyB0aGVtLCBzdXBwb3J0IHN0
YWZmICh0cmlhZ2luZyBmZWVkYmFjayByZXBvcnRzKSwKYW5kIG1vcmUgdGhhbiBhIGZldyBsaW51
eCBrZXJuZWwgZGV2cy4gQ2hhbmdpbmcgdG8gSU5GTyB3aWxsIGhpZGUgdGhlc2UKbWVzc2FnZXMg
ZnJvbSBtb3N0IGF1ZGllbmNlcy4KClNpZ25lZC1vZmYtYnk6IEdyYW50IEdydW5kbGVyIDxncnVu
ZGxlckBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9wY2kvcGNpZS9hZXIuYyB8IDIwICsrKysr
KysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2llL2Flci5jIGIvZHJpdmVycy9w
Y2kvcGNpZS9hZXIuYwppbmRleCBmNmMyNGRlZDEzNGMuLmQ3YmZjNjA3MGRkYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wY2kvcGNpZS9hZXIuYworKysgYi9kcml2ZXJzL3BjaS9wY2llL2Flci5jCkBA
IC02OTIsNyArNjkyLDcgQEAgc3RhdGljIHZvaWQgX19hZXJfcHJpbnRfZXJyb3Ioc3RydWN0IHBj
aV9kZXYgKmRldiwKIAogCWlmIChpbmZvLT5zZXZlcml0eSA9PSBBRVJfQ09SUkVDVEFCTEUpIHsK
IAkJc3RyaW5ncyA9IGFlcl9jb3JyZWN0YWJsZV9lcnJvcl9zdHJpbmc7Ci0JCWxldmVsID0gS0VS
Tl9XQVJOSU5HOworCQlsZXZlbCA9IEtFUk5fSU5GTzsKIAl9IGVsc2UgewogCQlzdHJpbmdzID0g
YWVyX3VuY29ycmVjdGFibGVfZXJyb3Jfc3RyaW5nOwogCQlsZXZlbCA9IEtFUk5fRVJSOwpAQCAt
NzI0LDcgKzcyNCw3IEBAIHZvaWQgYWVyX3ByaW50X2Vycm9yKHN0cnVjdCBwY2lfZGV2ICpkZXYs
IHN0cnVjdCBhZXJfZXJyX2luZm8gKmluZm8pCiAJbGF5ZXIgPSBBRVJfR0VUX0xBWUVSX0VSUk9S
KGluZm8tPnNldmVyaXR5LCBpbmZvLT5zdGF0dXMpOwogCWFnZW50ID0gQUVSX0dFVF9BR0VOVChp
bmZvLT5zZXZlcml0eSwgaW5mby0+c3RhdHVzKTsKIAotCWxldmVsID0gKGluZm8tPnNldmVyaXR5
ID09IEFFUl9DT1JSRUNUQUJMRSkgPyBLRVJOX1dBUk5JTkcgOiBLRVJOX0VSUjsKKwlsZXZlbCA9
IChpbmZvLT5zZXZlcml0eSA9PSBBRVJfQ09SUkVDVEFCTEUpID8gS0VSTl9JTkZPIDogS0VSTl9F
UlI7CiAKIAlwY2lfcHJpbnRrKGxldmVsLCBkZXYsICJQQ0llIEJ1cyBFcnJvcjogc2V2ZXJpdHk9
JXMsIHR5cGU9JXMsICglcylcbiIsCiAJCSAgIGFlcl9lcnJvcl9zZXZlcml0eV9zdHJpbmdbaW5m
by0+c2V2ZXJpdHldLApAQCAtNzk3LDE0ICs3OTcsMjIgQEAgdm9pZCBjcGVyX3ByaW50X2Flcihz
dHJ1Y3QgcGNpX2RldiAqZGV2LCBpbnQgYWVyX3NldmVyaXR5LAogCWluZm8ubWFzayA9IG1hc2s7
CiAJaW5mby5maXJzdF9lcnJvciA9IFBDSV9FUlJfQ0FQX0ZFUChhZXItPmNhcF9jb250cm9sKTsK
IAotCXBjaV9lcnIoZGV2LCAiYWVyX3N0YXR1czogMHglMDh4LCBhZXJfbWFzazogMHglMDh4XG4i
LCBzdGF0dXMsIG1hc2spOworCWlmIChhZXJfc2V2ZXJpdHkgPT0gQUVSX0NPUlJFQ1RBQkxFKQor
CQlwY2lfaW5mbyhkZXYsICJhZXJfc3RhdHVzOiAweCUwOHgsIGFlcl9tYXNrOiAweCUwOHhcbiIs
IHN0YXR1cywgbWFzayk7CisJZWxzZQorCQlwY2lfZXJyKGRldiwgImFlcl9zdGF0dXM6IDB4JTA4
eCwgYWVyX21hc2s6IDB4JTA4eFxuIiwgc3RhdHVzLCBtYXNrKTsKKwogCV9fYWVyX3ByaW50X2Vy
cm9yKGRldiwgJmluZm8pOwotCXBjaV9lcnIoZGV2LCAiYWVyX2xheWVyPSVzLCBhZXJfYWdlbnQ9
JXNcbiIsCi0JCWFlcl9lcnJvcl9sYXllcltsYXllcl0sIGFlcl9hZ2VudF9zdHJpbmdbYWdlbnRd
KTsKIAotCWlmIChhZXJfc2V2ZXJpdHkgIT0gQUVSX0NPUlJFQ1RBQkxFKQorCWlmIChhZXJfc2V2
ZXJpdHkgPT0gQUVSX0NPUlJFQ1RBQkxFKSB7CisJCXBjaV9pbmZvKGRldiwgImFlcl9sYXllcj0l
cywgYWVyX2FnZW50PSVzXG4iLAorCQkJYWVyX2Vycm9yX2xheWVyW2xheWVyXSwgYWVyX2FnZW50
X3N0cmluZ1thZ2VudF0pOworCX0gZWxzZSB7CisJCXBjaV9lcnIoZGV2LCAiYWVyX2xheWVyPSVz
LCBhZXJfYWdlbnQ9JXNcbiIsCisJCQlhZXJfZXJyb3JfbGF5ZXJbbGF5ZXJdLCBhZXJfYWdlbnRf
c3RyaW5nW2FnZW50XSk7CiAJCXBjaV9lcnIoZGV2LCAiYWVyX3VuY29yX3NldmVyaXR5OiAweCUw
OHhcbiIsCiAJCQlhZXItPnVuY29yX3NldmVyaXR5KTsKKwl9CiAKIAlpZiAodGxwX2hlYWRlcl92
YWxpZCkKIAkJX19wcmludF90bHBfaGVhZGVyKGRldiwgJmFlci0+aGVhZGVyX2xvZyk7Ci0tIAoy
LjQwLjEuNjA2LmdhNGIxYjEyOGQ2LWdvb2cKCg==
--00000000000082d49705fbf17e1b
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-PCI-AER-Rate-limit-the-reporting-of-the-correctable-.patch"
Content-Disposition: attachment; 
	filename="0002-PCI-AER-Rate-limit-the-reporting-of-the-correctable-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lhsq087t1>
X-Attachment-Id: f_lhsq087t1

RnJvbSA3MDgyMWJiZjU4YTlmZjFlYTMzZGNkZjhiZTE3MDIzZjI0MzdkNGViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSYWphdCBLaGFuZGVsd2FsIDxyYWphdC5raGFuZGVsd2FsQGxp
bnV4LmludGVsLmNvbT4KRGF0ZTogVHVlLCAzIEphbiAyMDIzIDIyOjI1OjQ4ICswNTMwClN1Ympl
Y3Q6IFtQQVRDSCAyLzJdIFBDSS9BRVI6IFJhdGUgbGltaXQgdGhlIHJlcG9ydGluZyBvZiB0aGUg
Y29ycmVjdGFibGUKIGVycm9ycwoKVGhlcmUgYXJlIG1hbnkgaW5zdGFuY2VzIHdoZXJlIGNvcnJl
Y3RhYmxlIGVycm9ycyB0ZW5kIHRvIGludW5kYXRlCnRoZSBtZXNzYWdlIGJ1ZmZlci4gV2Ugb2Jz
ZXJ2ZSBzdWNoIGluc3RhbmNlcyBkdXJpbmcgdGh1bmRlcmJvbHQgUENJZQp0dW5uZWxpbmcuCgpJ
dCdzIHRydWUgdGhhdCB0aGV5IGFyZSBtaXRpZ2F0ZWQgYnkgdGhlIGhhcmR3YXJlIGFuZCBhcmUg
bm9uLWZhdGFsCmJ1dCB3ZSBzaG91bGRuJ3QgYmUgc3BhbW1pbmcgdGhlIGxvZ3Mgd2l0aCBzdWNo
IGNvcnJlY3RhYmxlIGVycm9ycyBhcyBpdApjb25mdXNlcyBvdGhlciBrZXJuZWwgZGV2ZWxvcGVy
cyBsZXNzIGZhbWlsaWFyIHdpdGggUENJIGVycm9ycywgc3VwcG9ydApzdGFmZiwgYW5kIHVzZXJz
IHdobyBoYXBwZW4gdG8gbG9vayBhdCB0aGUgbG9ncywgaGVuY2UgcmF0ZSBsaW1pdCB0aGVtLgoK
QSB0eXBpY2FsIGV4YW1wbGUgbG9nIGluc2lkZSBhbiBIUCBUQlQ0IGRvY2s6Cls1NDkxMi42NjEx
NDJdIHBjaWVwb3J0IDAwMDA6MDA6MDcuMDogQUVSOiBNdWx0aXBsZSBDb3JyZWN0ZWQgZXJyb3Ig
cmVjZWl2ZWQ6IDAwMDA6MmI6MDAuMApbNTQ5MTIuNjYxMTk0XSBpZ2MgMDAwMDoyYjowMC4wOiBQ
Q0llIEJ1cyBFcnJvcjogc2V2ZXJpdHk9Q29ycmVjdGVkLCB0eXBlPURhdGEgTGluayBMYXllciwg
KFRyYW5zbWl0dGVyIElEKQpbNTQ5MTIuNjYxMjAzXSBpZ2MgMDAwMDoyYjowMC4wOiAgIGRldmlj
ZSBbODA4Njo1NTAyXSBlcnJvciBzdGF0dXMvbWFzaz0wMDAwMTEwMC8wMDAwMjAwMApbNTQ5MTIu
NjYxMjExXSBpZ2MgMDAwMDoyYjowMC4wOiAgICBbIDhdIFJvbGxvdmVyCls1NDkxMi42NjEyMTld
IGlnYyAwMDAwOjJiOjAwLjA6ICAgIFsxMl0gVGltZW91dApbNTQ5ODIuODM4NzYwXSBwY2llcG9y
dCAwMDAwOjAwOjA3LjA6IEFFUjogQ29ycmVjdGVkIGVycm9yIHJlY2VpdmVkOiAwMDAwOjJiOjAw
LjAKWzU0OTgyLjgzODc5OF0gaWdjIDAwMDA6MmI6MDAuMDogUENJZSBCdXMgRXJyb3I6IHNldmVy
aXR5PUNvcnJlY3RlZCwgdHlwZT1EYXRhIExpbmsgTGF5ZXIsIChUcmFuc21pdHRlciBJRCkKWzU0
OTgyLjgzODgwOF0gaWdjIDAwMDA6MmI6MDAuMDogICBkZXZpY2UgWzgwODY6NTUwMl0gZXJyb3Ig
c3RhdHVzL21hc2s9MDAwMDEwMDAvMDAwMDIwMDAKWzU0OTgyLjgzODgxN10gaWdjIDAwMDA6MmI6
MDAuMDogICAgWzEyXSBUaW1lb3V0CgpUaGlzIGdldHMgcmVwZWF0ZWQgY29udGludW91c2x5LCB0
aHVzIGludW5kYXRpbmcgdGhlIGJ1ZmZlci4KClNpZ25lZC1vZmYtYnk6IFJhamF0IEtoYW5kZWx3
YWwgPHJhamF0LmtoYW5kZWx3YWxAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBHcmFu
dCBHcnVuZGxlciA8Z3J1bmRsZXJAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvcGNpL3BjaWUv
YWVyLmMgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9wY2llL2Flci5jIGIvZHJpdmVycy9wY2kvcGNpZS9hZXIuYwppbmRl
eCBkN2JmYzYwNzBkZGIuLjgzMGY1YTEyNjFjOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvcGNp
ZS9hZXIuYworKysgYi9kcml2ZXJzL3BjaS9wY2llL2Flci5jCkBAIC02ODYsMjYgKzY4NiwzNiBA
QCBzdGF0aWMgdm9pZCBfX2Flcl9wcmludF9lcnJvcihzdHJ1Y3QgcGNpX2RldiAqZGV2LAogCQkJ
ICAgICAgc3RydWN0IGFlcl9lcnJfaW5mbyAqaW5mbykKIHsKIAljb25zdCBjaGFyICoqc3RyaW5n
czsKKwljaGFyIGFlcl9tc2dbNTEyXTsKIAl1bnNpZ25lZCBsb25nIHN0YXR1cyA9IGluZm8tPnN0
YXR1cyAmIH5pbmZvLT5tYXNrOwotCWNvbnN0IGNoYXIgKmxldmVsLCAqZXJybXNnOwogCWludCBp
OwogCi0JaWYgKGluZm8tPnNldmVyaXR5ID09IEFFUl9DT1JSRUNUQUJMRSkgewotCQlzdHJpbmdz
ID0gYWVyX2NvcnJlY3RhYmxlX2Vycm9yX3N0cmluZzsKLQkJbGV2ZWwgPSBLRVJOX0lORk87Ci0J
fSBlbHNlIHsKLQkJc3RyaW5ncyA9IGFlcl91bmNvcnJlY3RhYmxlX2Vycm9yX3N0cmluZzsKLQkJ
bGV2ZWwgPSBLRVJOX0VSUjsKLQl9CisJbWVtc2V0KGFlcl9tc2csIDAsIHNpemVvZigqYWVyX21z
ZykpOworCXNucHJpbnRmKGFlcl9tc2csIHNpemVvZigqYWVyX21zZyksICJhZXJfc3RhdHVzOiAw
eCUwOHgsIGFlcl9tYXNrOiAweCUwOHhcbiIsCisJCQlpbmZvLT5zdGF0dXMsIGluZm8tPm1hc2sp
OworCisJc3RyaW5ncyA9IChpbmZvLT5zZXZlcml0eSA9PSBBRVJfQ09SUkVDVEFCTEUpID8KKwkJ
YWVyX2NvcnJlY3RhYmxlX2Vycm9yX3N0cmluZyA6IGFlcl91bmNvcnJlY3RhYmxlX2Vycm9yX3N0
cmluZzsKIAogCWZvcl9lYWNoX3NldF9iaXQoaSwgJnN0YXR1cywgMzIpIHsKLQkJZXJybXNnID0g
c3RyaW5nc1tpXTsKKwkJY29uc3QgY2hhciAqZXJybXNnID0gc3RyaW5nc1tpXTsKKwkJY2hhciBi
aXRtc2dbNjRdOworCQltZW1zZXQoYml0bXNnLCAwLCBzaXplb2YoKmJpdG1zZykpOworCiAJCWlm
ICghZXJybXNnKQogCQkJZXJybXNnID0gIlVua25vd24gRXJyb3IgQml0IjsKIAotCQlwY2lfcHJp
bnRrKGxldmVsLCBkZXYsICIgICBbJTJkXSAlLTIycyVzXG4iLCBpLCBlcnJtc2csCi0JCQkJaW5m
by0+Zmlyc3RfZXJyb3IgPT0gaSA/ICIgKEZpcnN0KSIgOiAiIik7CisJCXNucHJpbnRmKGJpdG1z
Zywgc2l6ZW9mKCpiaXRtc2cpLCAiICAgWyUyZF0gJS0yMnMlc1xuIiwgaSwgZXJybXNnLAorCQkJ
ICAgIGluZm8tPmZpcnN0X2Vycm9yID09IGkgPyAiIChGaXJzdCkiIDogIiIpOworCisJCXN0cmxj
YXQoYWVyX21zZywgYml0bXNnLCBzaXplb2YoKmFlcl9tc2cpKTsKIAl9CisKKwlpZiAoaW5mby0+
c2V2ZXJpdHkgPT0gQUVSX0NPUlJFQ1RBQkxFKQorCQlwY2lfaW5mb19yYXRlbGltaXRlZChkZXYs
ICIlcyIsIGFlcl9tc2cpOworCWVsc2UKKwkJcGNpX2VycihkZXYsICIlcyIsIGFlcl9tc2cpOgor
CiAJcGNpX2Rldl9hZXJfc3RhdHNfaW5jcihkZXYsIGluZm8pOwogfQogCkBAIC03MTMsNyArNzIz
LDYgQEAgdm9pZCBhZXJfcHJpbnRfZXJyb3Ioc3RydWN0IHBjaV9kZXYgKmRldiwgc3RydWN0IGFl
cl9lcnJfaW5mbyAqaW5mbykKIHsKIAlpbnQgbGF5ZXIsIGFnZW50OwogCWludCBpZCA9ICgoZGV2
LT5idXMtPm51bWJlciA8PCA4KSB8IGRldi0+ZGV2Zm4pOwotCWNvbnN0IGNoYXIgKmxldmVsOwog
CiAJaWYgKCFpbmZvLT5zdGF0dXMpIHsKIAkJcGNpX2VycihkZXYsICJQQ0llIEJ1cyBFcnJvcjog
c2V2ZXJpdHk9JXMsIHR5cGU9SW5hY2Nlc3NpYmxlLCAoVW5yZWdpc3RlcmVkIEFnZW50IElEKVxu
IiwKQEAgLTcyNCwxNCArNzMzLDE5IEBAIHZvaWQgYWVyX3ByaW50X2Vycm9yKHN0cnVjdCBwY2lf
ZGV2ICpkZXYsIHN0cnVjdCBhZXJfZXJyX2luZm8gKmluZm8pCiAJbGF5ZXIgPSBBRVJfR0VUX0xB
WUVSX0VSUk9SKGluZm8tPnNldmVyaXR5LCBpbmZvLT5zdGF0dXMpOwogCWFnZW50ID0gQUVSX0dF
VF9BR0VOVChpbmZvLT5zZXZlcml0eSwgaW5mby0+c3RhdHVzKTsKIAotCWxldmVsID0gKGluZm8t
PnNldmVyaXR5ID09IEFFUl9DT1JSRUNUQUJMRSkgPyBLRVJOX0lORk8gOiBLRVJOX0VSUjsKLQot
CXBjaV9wcmludGsobGV2ZWwsIGRldiwgIlBDSWUgQnVzIEVycm9yOiBzZXZlcml0eT0lcywgdHlw
ZT0lcywgKCVzKVxuIiwKLQkJICAgYWVyX2Vycm9yX3NldmVyaXR5X3N0cmluZ1tpbmZvLT5zZXZl
cml0eV0sCi0JCSAgIGFlcl9lcnJvcl9sYXllcltsYXllcl0sIGFlcl9hZ2VudF9zdHJpbmdbYWdl
bnRdKTsKLQotCXBjaV9wcmludGsobGV2ZWwsIGRldiwgIiAgZGV2aWNlIFslMDR4OiUwNHhdIGVy
cm9yIHN0YXR1cy9tYXNrPSUwOHgvJTA4eFxuIiwKLQkJICAgZGV2LT52ZW5kb3IsIGRldi0+ZGV2
aWNlLCBpbmZvLT5zdGF0dXMsIGluZm8tPm1hc2spOworCWlmIChpbmZvLT5zZXZlcml0eSA9PSBB
RVJfQ09SUkVDVEFCTEUpIHsKKwkJcGNpX2luZm9fcmF0ZWxpbWl0ZWQoZGV2LCAiUENJZSBCdXMg
RXJyb3I6IHNldmVyaXR5PSVzLCB0eXBlPSVzLCAoJXMpXG4iCisJCQkJIiAgZGV2aWNlIFslMDR4
OiUwNHhdIGVycm9yIHN0YXR1cy9tYXNrPSUwOHgvJTA4eFxuIiwKKwkJCQkgICAgIGFlcl9lcnJv
cl9zZXZlcml0eV9zdHJpbmdbaW5mby0+c2V2ZXJpdHldLAorCQkJCSAgICAgYWVyX2Vycm9yX2xh
eWVyW2xheWVyXSwgYWVyX2FnZW50X3N0cmluZ1thZ2VudF0sCisJCQkJICAgICBkZXYtPnZlbmRv
ciwgZGV2LT5kZXZpY2UsIGluZm8tPnN0YXR1cywgaW5mby0+bWFzayk7CisJfSBlbHNlIHsKKwkJ
cGNpX2VycihkZXYsICJQQ0llIEJ1cyBFcnJvcjogc2V2ZXJpdHk9JXMsIHR5cGU9JXMsICglcylc
biIsCisJCQkiICBkZXZpY2UgWyUwNHg6JTA0eF0gZXJyb3Igc3RhdHVzL21hc2s9JTA4eC8lMDh4
XG4iLAorCQkJYWVyX2Vycm9yX3NldmVyaXR5X3N0cmluZ1tpbmZvLT5zZXZlcml0eV0sCisJCQlh
ZXJfZXJyb3JfbGF5ZXJbbGF5ZXJdLCBhZXJfYWdlbnRfc3RyaW5nW2FnZW50XSwKKwkJCWRldi0+
dmVuZG9yLCBkZXYtPmRldmljZSwgaW5mby0+c3RhdHVzLCBpbmZvLT5tYXNrKTsKKwl9CiAKIAlf
X2Flcl9wcmludF9lcnJvcihkZXYsIGluZm8pOwogCkBAIC03NTEsMTEgKzc2NSwxOSBAQCBzdGF0
aWMgdm9pZCBhZXJfcHJpbnRfcG9ydF9pbmZvKHN0cnVjdCBwY2lfZGV2ICpkZXYsIHN0cnVjdCBh
ZXJfZXJyX2luZm8gKmluZm8pCiAJdTggYnVzID0gaW5mby0+aWQgPj4gODsKIAl1OCBkZXZmbiA9
IGluZm8tPmlkICYgMHhmZjsKIAotCXBjaV9pbmZvKGRldiwgIiVzJXMgZXJyb3IgcmVjZWl2ZWQ6
ICUwNHg6JTAyeDolMDJ4LiVkXG4iLAotCQkgaW5mby0+bXVsdGlfZXJyb3JfdmFsaWQgPyAiTXVs
dGlwbGUgIiA6ICIiLAotCQkgYWVyX2Vycm9yX3NldmVyaXR5X3N0cmluZ1tpbmZvLT5zZXZlcml0
eV0sCi0JCSBwY2lfZG9tYWluX25yKGRldi0+YnVzKSwgYnVzLCBQQ0lfU0xPVChkZXZmbiksCi0J
CSBQQ0lfRlVOQyhkZXZmbikpOworCWlmIChpbmZvLT5zZXZlcml0eSA9PSBBRVJfQ09SUkVDVEFC
TEUpCisJCXBjaV9pbmZvX3JhdGVsaW1pdGVkKGRldiwgIiVzJXMgZXJyb3IgcmVjZWl2ZWQ6ICUw
NHg6JTAyeDolMDJ4LiVkXG4iLAorCQkJCSAgICAgaW5mby0+bXVsdGlfZXJyb3JfdmFsaWQgPyAi
TXVsdGlwbGUgIiA6ICIiLAorCQkJCSAgICAgYWVyX2Vycm9yX3NldmVyaXR5X3N0cmluZ1tpbmZv
LT5zZXZlcml0eV0sCisJCQkJICAgICBwY2lfZG9tYWluX25yKGRldi0+YnVzKSwgYnVzLCBQQ0lf
U0xPVChkZXZmbiksCisJCQkJICAgICBQQ0lfRlVOQyhkZXZmbikpOworCWVsc2UKKwkJcGNpX2lu
Zm8oZGV2LCAiJXMlcyBlcnJvciByZWNlaXZlZDogJTA0eDolMDJ4OiUwMnguJWRcbiIsCisJCQkg
aW5mby0+bXVsdGlfZXJyb3JfdmFsaWQgPyAiTXVsdGlwbGUgIiA6ICIiLAorCQkJIGFlcl9lcnJv
cl9zZXZlcml0eV9zdHJpbmdbaW5mby0+c2V2ZXJpdHldLAorCQkJIHBjaV9kb21haW5fbnIoZGV2
LT5idXMpLCBidXMsIFBDSV9TTE9UKGRldmZuKSwKKwkJCSBQQ0lfRlVOQyhkZXZmbikpOworCiB9
CiAKICNpZmRlZiBDT05GSUdfQUNQSV9BUEVJX1BDSUVBRVIKQEAgLTc5OCw3ICs4MjAsNyBAQCB2
b2lkIGNwZXJfcHJpbnRfYWVyKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGludCBhZXJfc2V2ZXJpdHks
CiAJaW5mby5maXJzdF9lcnJvciA9IFBDSV9FUlJfQ0FQX0ZFUChhZXItPmNhcF9jb250cm9sKTsK
IAogCWlmIChhZXJfc2V2ZXJpdHkgPT0gQUVSX0NPUlJFQ1RBQkxFKQotCQlwY2lfaW5mbyhkZXYs
ICJhZXJfc3RhdHVzOiAweCUwOHgsIGFlcl9tYXNrOiAweCUwOHhcbiIsIHN0YXR1cywgbWFzayk7
CisJCXBjaV9pbmZvX3JhdGVsaW1pdGVkKGRldiwgImFlcl9zdGF0dXM6IDB4JTA4eCwgYWVyX21h
c2s6IDB4JTA4eFxuIiwgc3RhdHVzLCBtYXNrKTsKIAllbHNlCiAJCXBjaV9lcnIoZGV2LCAiYWVy
X3N0YXR1czogMHglMDh4LCBhZXJfbWFzazogMHglMDh4XG4iLCBzdGF0dXMsIG1hc2spOwogCkBA
IC04MDgsOSArODMwLDkgQEAgdm9pZCBjcGVyX3ByaW50X2FlcihzdHJ1Y3QgcGNpX2RldiAqZGV2
LCBpbnQgYWVyX3NldmVyaXR5LAogCQlwY2lfaW5mbyhkZXYsICJhZXJfbGF5ZXI9JXMsIGFlcl9h
Z2VudD0lc1xuIiwKIAkJCWFlcl9lcnJvcl9sYXllcltsYXllcl0sIGFlcl9hZ2VudF9zdHJpbmdb
YWdlbnRdKTsKIAl9IGVsc2UgewotCQlwY2lfZXJyKGRldiwgImFlcl9sYXllcj0lcywgYWVyX2Fn
ZW50PSVzXG4iLAotCQkJYWVyX2Vycm9yX2xheWVyW2xheWVyXSwgYWVyX2FnZW50X3N0cmluZ1th
Z2VudF0pOwotCQlwY2lfZXJyKGRldiwgImFlcl91bmNvcl9zZXZlcml0eTogMHglMDh4XG4iLAor
CQlwY2lfZXJyKGRldiwgImFlcl9sYXllcj0lcywgYWVyX2FnZW50PSVzLCIKKwkJCSIgYWVyX3Vu
Y29yX3NldmVyaXR5PTB4JTA4eFxuIiwKKwkJCWFlcl9lcnJvcl9sYXllcltsYXllcl0sIGFlcl9h
Z2VudF9zdHJpbmdbYWdlbnRdLAogCQkJYWVyLT51bmNvcl9zZXZlcml0eSk7CiAJfQogCi0tIAoy
LjQwLjEuNjA2LmdhNGIxYjEyOGQ2LWdvb2cKCg==
--00000000000082d49705fbf17e1b--
