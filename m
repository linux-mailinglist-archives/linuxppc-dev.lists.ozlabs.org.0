Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C041B1C9E62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:22:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49J7Hj1MVWzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:22:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=A7Luyxmk; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49J0Yw5f8kzDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 03:19:14 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id h12so4043386pjz.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+b7EYNwiBXjbS7SOmN7A/5vLb3tfUE6A8vXdX6xQXjE=;
 b=A7LuyxmkoGIaG2TDRbQc8kdWacDIMy8ygneWUosRVjkdhr3IffafvuyqF5rbaZvB34
 95su7BTV0hzo8SUkrlQRcJG5xDbc+NzhGtAiEm8Ogyu23vmnW7woEcw1CBaStoX0N8v8
 PXejXzFs3ZK3HNmZkwM6YXW/7lAirnm6jPstiA9RZ61U9WBlWg8MoW4qj1Ig99j7pD/p
 nM6LQyXvWEjWnWOXrM/lnHC/9Qq5mQtA4sifvayTDg5CTqK+wDE52YZ1gtLDh3086KMS
 Xs6fE9r9sgjkyqMpGz4uT2KVqt889tPgCrA3Cvj/5xNGh4+Zig6fzdoZxMmJoDAp6JDy
 YypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+b7EYNwiBXjbS7SOmN7A/5vLb3tfUE6A8vXdX6xQXjE=;
 b=CJUZEf/P+biUnV6cq3FcLW/0GYYHAPb8ApVq3lVER9rAmsHZR0mVDaiPcdNJzABQli
 Iu+MO7qnFnnHDZx4crc8zUchwcEEfXribesWtgr7FeN6BGEOv8BGf+trl7/zcA0ewaGE
 Bl5R990nlI+g/Hk7zA4+XvjvZ6SXgwwNFVgvtTSp+IzrfCyyFAy2Ti30bCfE0dLSSP3/
 TqnVfRfanqj3Effe5FCIhDf30PjIILt3pUtDwJAXdUwosZ8G+20+bl2k1gWrPB3A1+c5
 EKJU8EXKQUJoowHGpW4mwHtinsJwTUuodDBp64Q5JVIPO3RpwuD4+DSJCfs+fZbY6Ohj
 gVPA==
X-Gm-Message-State: AGi0PuYUNb+3SMFdSn88A+KwJgArmctsXvULsE+IJftUyqMyJ+GLwGt9
 U8LpFVMAGpBu65Jcn/TJXMQZJLxmq8RwLBJ9i/H2A+vRLVg=
X-Google-Smtp-Source: APiQypKAzkG9+jJThGRVXk5Z6TfvEO/jlBKRpVeNkSmWHb2uATIkCw8r7aOtBF98bR7AB6QUvFP8rLZ4/UrTFheCJW0=
X-Received: by 2002:a17:90b:957:: with SMTP id
 dw23mr1180035pjb.101.1588871950395; 
 Thu, 07 May 2020 10:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <ClangBuiltLinux/continuous-integration+164415390+broken@travis-ci.com>
 <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
In-Reply-To: <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 May 2020 10:18:57 -0700
Message-ID: <CAKwvOdmendjEgurRBAyi4R0rDZRdwfHjddS_pfOQ6761XiiFMA@mail.gmail.com>
Subject: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432
 (master - 0aceafc)
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000331c4705a5121417"
X-Mailman-Approved-At: Fri, 08 May 2020 08:20:45 +1000
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000331c4705a5121417
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like ppc64le powernv_defconfig is suddenly failing the locking
torture tests, then locks up?
https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/32=
9211572#L3111-L3167
Any recent changes related here in -next?  I believe this is the first
failure, so I'll report back if we see this again.

---------- Forwarded message ---------
From: Travis CI <builds@travis-ci.com>
Date: Thu, May 7, 2020 at 9:40 AM
Subject: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432 (master
- 0aceafc)
To: <ndesaulniers@google.com>, <natechancellor@gmail.com>


ClangBuiltLinux

/

continuous-integration
<https://travis-ci.com/github/ClangBuiltLinux/continuous-integration?utm_me=
dium=3Dnotification&utm_source=3Demail>

[image: branch icon]master
<https://github.com/ClangBuiltLinux/continuous-integration/tree/master>
[image: build has failed]
Build #1432 was broken
<https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds=
/164415390?utm_medium=3Dnotification&utm_source=3Demail>
[image: arrow to build time]
[image: clock icon]7 hrs, 0 mins, and 54 secs

[image: Nick Desaulniers avatar]Nick Desaulniers
0aceafc CHANGESET =E2=86=92
<https://github.com/ClangBuiltLinux/continuous-integration/compare/877d002b=
dcfe6bc5cb0255c3c39192e8175e2c19...0aceafcfcca7c4a095957efae0939a612d755077=
>

Merge pull request #182 from ClangBuiltLinux/i386

i386

Want to know about upcoming build environment updates?

Would you like to stay up-to-date with the upcoming Travis CI build
environment updates? We set up a mailing list for you!
SIGN UP HERE <http://eepurl.com/9OCsP>

[image: book icon]

Documentation <https://docs.travis-ci.com/> about Travis CI
Have any questions? We're here to help. <support@travis-ci.com>
Unsubscribe
<https://travis-ci.com/account/preferences/unsubscribe?repository=3D6718752=
&utm_medium=3Dnotification&utm_source=3Demail>
from build emails from the ClangBuiltLinux/continuous-integration
repository.
To unsubscribe from *all* build emails, please update your settings
<https://travis-ci.com/account/preferences/unsubscribe?utm_medium=3Dnotific=
ation&utm_source=3Demail>.

[image: black and white travis ci logo] <https://travis-ci.com>

Travis CI GmbH, Rigaer Str. 8, 10427 Berlin, Germany | GF/CEO: Randy Jacops
| Contact: contact@travis-ci.com | Amtsgericht Charlottenburg, Berlin, HRB
140133 B | Umsatzsteuer-ID gem=C3=A4=C3=9F =C2=A727 a Umsatzsteuergesetz: D=
E282002648


--=20
Thanks,
~Nick Desaulniers

--000000000000331c4705a5121417
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like=C2=A0<span style=3D"color:rgb(102,102,102);font=
-family:&quot;Source Sans Pro&quot;,Helvetica,sans-serif;font-size:15px">pp=
c64le=C2=A0</span>powernv_defconfig=C2=A0<span style=3D"color:rgb(102,102,1=
02);font-family:&quot;Source Sans Pro&quot;,Helvetica,sans-serif;font-size:=
15px">is suddenly failing the locking torture tests, then locks up?</span><=
div><a href=3D"https://travis-ci.com/github/ClangBuiltLinux/continuous-inte=
gration/jobs/329211572#L3111-L3167">https://travis-ci.com/github/ClangBuilt=
Linux/continuous-integration/jobs/329211572#L3111-L3167</a></div><div>Any r=
ecent changes related here in -next?=C2=A0 I believe this is the first fail=
ure, so I&#39;ll report back if we see this again.<br><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded messag=
e ---------<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Travis=
 CI</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:builds@travis-ci.com"=
>builds@travis-ci.com</a>&gt;</span><br>Date: Thu, May 7, 2020 at 9:40 AM<b=
r>Subject: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432 (mast=
er - 0aceafc)<br>To:  &lt;<a href=3D"mailto:ndesaulniers@google.com">ndesau=
lniers@google.com</a>&gt;,  &lt;<a href=3D"mailto:natechancellor@gmail.com"=
>natechancellor@gmail.com</a>&gt;<br></div><br><br><u></u>

 =20
   =20
   =20
   =20
   =20
 =20
  <div style=3D"min-width:100%;height:100%;margin:0;padding:0">
    <table id=3D"m_-2796893908401158459travis-ci-email-container" align=3D"=
center" border=3D"0" cellpadding=3D"0" cellspacing=3D"0" height=3D"100%" wi=
dth=3D"100%" style=3D"height:100%;width:100%;padding:10px;font-family:&#39;=
Source Sans Pro&#39;,&#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif;li=
ne-height:150%;text-align:center;color:#333333;background-color:#f4f5f9;bac=
kground-image:url(&quot;&quot;);height:100%;width:100%;padding:10px;font-fa=
mily:&#39;Source Sans Pro&#39;,&#39;Helvetica Neue&#39;,Helvetica,Arial,san=
s-serif;line-height:150%;text-align:center;color:#333333;background-color:#=
f4f5f9;background-image:url()">
      <tbody><tr>
        <td align=3D"center" valign=3D"top" style=3D"padding-bottom:20px">
          <table id=3D"m_-2796893908401158459email-content-container" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"width:500px;padding:32=
px;background-color:#ffffff;width:500px;padding:32px;background-color:#ffff=
ff">
           =20
            <tbody><tr>
              <td id=3D"m_-2796893908401158459repo-username-section" align=
=3D"center" valign=3D"top" style=3D"padding-bottom:20px;padding-bottom:20px=
">
                <a id=3D"m_-2796893908401158459repo-username-link" style=3D=
"color:#333333;text-decoration:none;border-bottom:1px solid #333333;padding=
-bottom:4px;color:#333333;border-bottom:1px solid #333333;text-decoration:n=
one;padding-bottom:4px" href=3D"https://travis-ci.com/github/ClangBuiltLinu=
x/continuous-integration?utm_medium=3Dnotification&amp;utm_source=3Demail" =
target=3D"_blank">
                  <p style=3D"margin:0px;font-size:30px;font-weight:600;lin=
e-height:36px;padding-left:5px;display:inline;font-size:30px;font-weight:60=
0;line-height:36px;padding-right:5px;padding-left:0px">ClangBuiltLinux</p>
                  <p id=3D"m_-2796893908401158459repo-slug-divider" style=
=3D"margin:0px;font-size:30px;font-weight:100;color:#9ea3a8;display:inline;=
font-size:30px;font-weight:100;color:#9ea3a8">/</p>
                  <p style=3D"margin:0px;font-size:30px;font-weight:600;lin=
e-height:36px;padding-left:5px;display:inline;font-size:30px;font-weight:60=
0;line-height:36px;padding-left:5px">continuous-integration</p>
</a>              </td>
            </tr>
           =20
            <tr>
              <td id=3D"m_-2796893908401158459branch-name-section" align=3D=
"center" valign=3D"top" style=3D"padding-bottom:35px">
                <p id=3D"m_-2796893908401158459branch-name" style=3D"margin=
:0px;font-size:28px;font-weight:300;margin:0px;font-size:28px;font-weight:3=
00">
                  <img alt=3D"branch icon" style=3D"width:16px;height:auto;=
padding-right:8px;vertical-align:bottom;width:16px;height:auto;padding-righ=
t:8px;vertical-align:bottom" src=3D"https://s3.amazonaws.com/travis-email-a=
ssets/branch.png"><a id=3D"m_-2796893908401158459branch-name-link" style=3D=
"color:#333333;line-height:36px;text-decoration:none;border-bottom:1px soli=
d #333333;text-decoration:none;border-bottom:1px solid #333333;padding-bott=
om:2px;line-height:36px" href=3D"https://github.com/ClangBuiltLinux/continu=
ous-integration/tree/master" target=3D"_blank">master</a>
                </p>
              </td>
            </tr>
           =20
            <tr>
              <td align=3D"center" valign=3D"top" style=3D"padding-bottom:2=
0px">
                <table cellpadding=3D"0" cellspacing=3D"0" style=3D"border-=
radius:3px;border:1px solid #db4545;width:100%">
                  <tbody><tr style=3D"background:rgba(219,69,69,0.1)">
                    <td id=3D"m_-2796893908401158459status-icon-section" al=
ign=3D"center" valign=3D"top" style=3D"border-bottom:1px solid #db4545;padd=
ing:15px 15px">
                    <div style=3D"float:left">
                      <div style=3D"display:inline"><img alt=3D"build has f=
ailed" style=3D"display:inline;vertical-align:sub;width:17px;height:17px;pa=
dding-right:8px" src=3D"https://s3.amazonaws.com/travis-email-assets/status=
-failed.png"></div><div style=3D"display:inline"><a id=3D"m_-27968939084011=
58459status-section-message" class=3D"m_-2796893908401158459failure" style=
=3D"color:#db4545;font-size:16px;font-weight:600" href=3D"https://travis-ci=
.com/github/ClangBuiltLinux/continuous-integration/builds/164415390?utm_med=
ium=3Dnotification&amp;utm_source=3Demail" target=3D"_blank">Build #1432 wa=
s broken</a></div>
                    </div>
                      <div style=3D"display:inline;float:left"><img id=3D"m=
_-2796893908401158459arrow" alt=3D"arrow to build time" style=3D"width:7px;=
height:auto;vertical-align:text-bottom;padding:0px 8px" src=3D"https://s3.a=
mazonaws.com/travis-email-assets/failure-arrow.png"></div>
                    <div style=3D"float:right">
                      <span><img id=3D"m_-2796893908401158459build-time-clo=
ck-icon" alt=3D"clock icon" style=3D"width:15px;height:17px;padding-right:8=
px;vertical-align:sub" src=3D"https://s3.amazonaws.com/travis-email-assets/=
time.png"></span><span style=3D"font-size:14px">7 hrs, 0 mins, and 54 secs<=
/span>
                    </div>
                    </td>
                  </tr>
                  <tr>
                    <td id=3D"m_-2796893908401158459user-avatar-changeset-s=
ection" align=3D"center" valign=3D"top" style=3D"padding-bottom:32px;paddin=
g:20px 15px 35px 15px">
                      <div id=3D"m_-2796893908401158459user-avatar-changese=
t-left" style=3D"float:left;float:left">
                        <p style=3D"margin:0px;display:inline;font-size:14p=
x;font-weight:700;color:#333333">
                          <img alt=3D"Nick Desaulniers avatar" style=3D"wid=
th:22px;height:auto;border-radius:10px;vertical-align:middle;margin-right:8=
px" src=3D"https://secure.gravatar.com/avatar/0937c37d243f4e436c9ad4342ea97=
55c">Nick Desaulniers
                        </p>
                      </div>
                      <div id=3D"m_-2796893908401158459user-avatar-changese=
t-right" style=3D"float:right;float:right">
                        <a id=3D"m_-2796893908401158459changeset-link" styl=
e=3D"font-size:14px;font-weight:600;color:#0068ff;font-size:14px;color:#006=
8ff;font-weight:600" href=3D"https://github.com/ClangBuiltLinux/continuous-=
integration/compare/877d002bdcfe6bc5cb0255c3c39192e8175e2c19...0aceafcfcca7=
c4a095957efae0939a612d755077" target=3D"_blank">0aceafc CHANGESET =E2=86=92=
</a>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td id=3D"m_-2796893908401158459commit-message-section"=
 align=3D"center" valign=3D"top" style=3D"min-height:104px;padding:0px 20px=
 20px 20px;min-height:104px;padding:0px 15px 20px 15px">
                      <p id=3D"m_-2796893908401158459commit-message" style=
=3D"margin:0px;font-family:cousine,monospace;font-size:14px;line-height:22p=
x;font-family:cousine,monospace;font-size:14px;text-align:left;line-height:=
22px">Merge pull request #182 from ClangBuiltLinux/i386<br><br>i386</p>
                    </td>
                  </tr>
                </tbody></table>
              </td>
            </tr>
          </tbody></table>
        </td>
      </tr>
     =20
     =20
      <tr>
        <td id=3D"m_-2796893908401158459update-section" align=3D"center" va=
lign=3D"top" style=3D"padding-bottom:20px;padding-bottom:20px">
          <table id=3D"m_-2796893908401158459update-container" border=3D"0"=
 cellpadding=3D"0" cellspacing=3D"0" style=3D"width:500px;padding:32px 32px=
 42px 32px;background-color:#ffffff;width:500px;padding:32px 32px 42px 32px=
;background-color:#ffffff">
            <tbody><tr>
              <td align=3D"center" valign=3D"top">
                <p id=3D"m_-2796893908401158459update-header" style=3D"marg=
in:0px;font-size:24px;line-height:31px;margin-bottom:20px;padding-bottom:10=
px;border-bottom:2px solid #0068ff;border-bottom:2px solid #0068ff;padding-=
bottom:10px;font-size:24px;line-height:31px;margin-bottom:20px">Want to kno=
w about upcoming build environment updates?</p>
                <p id=3D"m_-2796893908401158459update-message" style=3D"mar=
gin:0px;font-size:16px;font-weight:300;line-height:26px;margin-bottom:32px;=
font-size:16px;line-height:26px;font-weight:300;margin-bottom:32px">Would y=
ou like to stay up-to-date with the upcoming Travis CI build environment up=
dates? We set up a mailing list for you!</p>
                <a id=3D"m_-2796893908401158459sign-up-button" style=3D"fon=
t-size:14px;font-weight:600;color:#ffffff;text-decoration:none;background-c=
olor:#0068ff;padding:12px 20px;border-radius:3px;font-size:14px;font-weight=
:600;color:#ffffff;background-color:#0068ff;text-decoration:none;padding:12=
px 20px;border-radius:3px" href=3D"http://eepurl.com/9OCsP" target=3D"_blan=
k">SIGN UP HERE</a>
              </td>
            </tr>
          </tbody></table>
        </td>
      </tr>
     =20
      <tr>
        <td align=3D"center" valign=3D"top" style=3D"padding-bottom:20px">
          <table id=3D"m_-2796893908401158459documentation-container" borde=
r=3D"0" cellpadding=3D"0" cellspacing=3D"0" style=3D"width:500px;padding:25=
px;background-color:rgba(222,239,255,0.3);border:1px solid #66a4ff;border-r=
adius:3px;width:500px;padding:25px;background-color:rgba(222,239,255,0.3);b=
order:1px solid #66a4ff;border-radius:3px">
            <tbody><tr>
              <td id=3D"m_-2796893908401158459documentation-section" align=
=3D"center" valign=3D"top">
                <div>
                  <img alt=3D"book icon" id=3D"m_-2796893908401158459docume=
ntation-icon" style=3D"display:inline;vertical-align:bottom;padding-right:5=
px;display:inline;vertical-align:bottom;padding-right:5px" src=3D"https://s=
3.amazonaws.com/travis-email-assets/documentation.png">
                  <p id=3D"m_-2796893908401158459documentation-text" style=
=3D"margin:0px;display:inline;font-size:26px;font-weight:300;color:#0068ff;=
font-size:26px;font-weight:300;color:#0068ff;display:inline">
                    <a id=3D"m_-2796893908401158459documentation-link" href=
=3D"https://docs.travis-ci.com/" style=3D"color:#0068ff" target=3D"_blank">=
Documentation</a> about Travis CI
                  </p>
                </div>
              </td>
            </tr>
          </tbody></table>
        </td>
      </tr>
     =20
      <tr>
        <td align=3D"center" valign=3D"top">
          <table id=3D"m_-2796893908401158459travis-ci-email-footer-contain=
er" border=3D"0" cellpadding=3D"20" cellspacing=3D"0" style=3D"width:500px;=
width:500px">
            <tbody><tr>
              <td id=3D"m_-2796893908401158459questions-section" align=3D"c=
enter" valign=3D"top" style=3D"font-weight:300;color:#0068ff;color:#0068ff;=
font-weight:300">
                <span>Have any questions?</span>
                <span>
                  <a href=3D"mailto:support@travis-ci.com" style=3D"color:#=
0068ff" target=3D"_blank">We&#39;re here to help.</a>
                </span>
              </td>
            </tr>
            <tr>
              <td id=3D"m_-2796893908401158459email-footer-section" align=
=3D"center" valign=3D"top" style=3D"font-size:10px;line-height:200%;text-al=
ign:center;color:#9ea3a8;padding-top:0px">
                <span>
                    <a href=3D"https://travis-ci.com/account/preferences/un=
subscribe?repository=3D6718752&amp;utm_medium=3Dnotification&amp;utm_source=
=3Demail" style=3D"color:#9ea3a8" target=3D"_blank">Unsubscribe</a> from bu=
ild emails from the ClangBuiltLinux/continuous-integration repository.
                </span>
              </td>
            </tr>
            <tr>
              <td id=3D"m_-2796893908401158459email-footer-section" align=
=3D"center" valign=3D"top" style=3D"font-size:10px;line-height:200%;text-al=
ign:center;color:#9ea3a8;padding-top:0px">
                <span>
                  To unsubscribe from <strong>all</strong> build emails, pl=
ease update your <a href=3D"https://travis-ci.com/account/preferences/unsub=
scribe?utm_medium=3Dnotification&amp;utm_source=3Demail" style=3D"color:#9e=
a3a8" target=3D"_blank">settings</a>.
                </span>
              </td>
            </tr>
            <tr>
              <td id=3D"m_-2796893908401158459travis-ci-footer-logo-section=
" style=3D"text-align:center;text-align:center">
                <a href=3D"https://travis-ci.com" target=3D"_blank"><img al=
t=3D"black and white travis ci logo" src=3D"https://s3.amazonaws.com/travis=
-email-assets/TravisCI-Logo-BW.png"></a>
              </td>
            </tr>
            <tr>
              <td id=3D"m_-2796893908401158459email-footer-section" style=
=3D"font-size:10px;line-height:200%;text-align:center;color:#9ea3a8;padding=
-top:0px;color:#9ea3a8;font-size:10px;line-height:200%;text-align:center;co=
lor:#9ea3a8;padding-top:0px">
                <p style=3D"margin:0px;margin:0px">Travis CI GmbH, Rigaer S=
tr. 8, 10427 Berlin, Germany | GF/CEO: Randy Jacops |
                  <span>Contact: <a style=3D"color:#9ea3a8;color:#9ea3a8" h=
ref=3D"mailto:contact@travis-ci.com" target=3D"_blank">contact@travis-ci.co=
m</a> | Amtsgericht Charlottenburg, Berlin, HRB 140133 B | Umsatzsteuer-ID =
gem=C3=A4=C3=9F =C2=A727 a Umsatzsteuergesetz: DE282002648</span>
                </p>
              </td>
            </tr>
          </tbody></table>
        </td>
      </tr>
    </tbody></table>
   =20
  </div>



</div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Thanks,<d=
iv>~Nick Desaulniers</div></div></div></div></div>

--000000000000331c4705a5121417--
